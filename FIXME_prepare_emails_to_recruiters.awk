#!/usr/bin/awk -f

# Compose cover letter from Simple template
# This script accepts csv input file with the following format:
#   position;recipient;company;position field;short company attribute;company characteristics;company merits;my interest in posision

BEGIN {
    FS=";";

    # Files and folders constants
    template=system("find * -type f | fzf");

    getline;
    NR=0;
}

{
    # Read relevant fields from input file
    position=$1;
    recipient=$2;
    company=$3;
    position_field=$4;
    company_short_attr=$5;
    company_characteristics=$6;
    company_merits=$7;
    my_interest=$8;

    # Set output filename
    outfile=("Cover Letter - "company" - "position".txt");

    # Read a line from template, replace special fields, and print result to output file
    while ( (getline ln < template) > 0 )
    {
        sub(/{recipient}/,recipient,ln);
        sub(/{position}/,position,ln);
        sub(/{company}/,company,ln);
        sub(/{position-field}/,position_field,ln);
        sub(/{company-short-attr}/,company_short_attr,ln);
        sub(/{company-characteristics}/,company_characteristics,ln);
        sub(/{company-merits}/,company_merits,ln);
        sub(/{my-interest}/,my_interest,ln);
        print(ln) > outfile;
    }

    # Close template and output files in advance of next record
    close(outfile);
    close(template);
}
