#!/bin/bash

file_name=$1
num_of_col=$2
outlier_col=$3

# Before beginning:

# a. Ensure file name is provided
if [[ -z "$file_name" ]]; then
    echo "Usage: $0 <file_name> <num_of_col> <outlier_col>"
    exit 1
fi

# b. Remove the multiple commas for name of house listing
IFS=','

# Read the file line by line
while read -r line; do
    # Split the line into an array of fields
    fields=($line)
    fields_length=${#fields[@]}

    if (( fields_length > 18 )); then
        echo "STARTING -----------------------------"

        # Set indexes for concatenation
        start_index=1
        end_index=$(( fields_length - 14 ))
	
	# Debugging: Print end_index
	echo "end_index: $end_index"

	# Ensure end_index is within bounds
        if (( end_index < 0 )); then
            echo "Invalid end_index: $end_index"
            continue
        fi

        # Concatenate fields from start_index to end_index - 1
        concatenated_fields=""
        for (( i=start_index; i<end_index; i++ )); do
            concatenated_fields+="${fields[i]}"
        done

        # Remove the trailing space
        concatenated_fields="${concatenated_fields% }"
        echo "----------------------> CHANGED ${concatenated_fields}"

        # Modify the array in place
        fields=(
            "${fields[0]}"            # Keep the first field
            "$concatenated_fields"    # Insert the concatenated fields
            "${fields[@]:end_index}"  # Append the last 14 fields
        )
    fi

    # Output the modified fields as a CSV line
    # echo "${fields[*]}" | sed 's/ /,/g' | sed 's/,/ /g; s/ /,/g'
    echo "${fields[*]}" >> "rm_commas_output.csv"
done < "$file_name"



# Task 1: Identify missing values

# Handle trailing spaces/new lines.
awk -F, '{
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", $0); # Trim trailing spaces
    gsub(/\t/, "", $0); # Remove tabs
    gsub(/\n/, "", $0); # Remove newlines
    print
}' "$file_name" > input_data.csv

# Identify missing values
awk -F, -v col=$2 'NF==col' input_data.csv > input_data1.csv



# Task 2: Remove rows with missing values

# If there are missing values, loop through each column and remove rows with missing values
awk -F',' -v OFS=',' '
{
	missing = 0;
	for (i=1; i<=NF; i++) {
		if ($i == "") {missing = 1; break}
    	}
	if (missing == 0) { print $0 };
}' input_data1.csv > clean_data.csv



# Task 3:  Remove duplicate

# Extract the header and store it temporarily
head -n 1 clean_data.csv > unique_data.csv

# Sort and remove duplicates from the remaining rows, then append to the file
tail -n +2 clean_data.csv | sort -t',' -k 1,1 | uniq >> unique_data.csv



# Task 4: Identifying and handling outliers

# Select the column that need to hande outliers
cut -d',' -f$outlier_col unique_data.csv | sort -nu > field_values.txt

# Calculate Q1, Q2, Q3
total_rows=$(wc -l < field_values.txt)

Q1=$(awk -v total="$total_rows" 'NR==int(total/4) {print; exit}' field_values.txt)
Q2=$(awk -v total="$total_rows" 'NR==int(total/2) {print; exit}' field_values.txt)
Q3=$(awk -v total="$total_rows" 'NR==int(total*3/4) {print; exit}' field_values.txt)

echo "First quartile: $Q1"
echo "Second quartile: $Q2"
echo "Third quartile: $Q3"

# Calculate the IQR and determine the bounds for outliers
IQR=$(echo "$Q3 - $Q1" | bc)
lower_bound=$(echo "$Q1 - 1.5 * $IQR" | bc)
upper_bound=$(echo "$Q3 + 1.5 * $IQR" | bc)

echo "Lower bound: $lower_bound"
echo "Upper bound: $upper_bound"


# Replace outliers with Q2 (Median)
awk -F',' -v q2="$Q2" -v lb="$lower_bound" -v ub="$upper_bound" -v col="$outlier_col" '
{
    if ($col < lb || $col > ub) {
        $col = q2;
    }
    print $0;
}' OFS=',' unique_data.csv > final_output.csv

rm -f rm_commas_output.csv input_data.csv input_data1.csv clean_data.csv unique_data.csv field_values.txt

