#!/usr/bin/awk -f

BEGIN {
    FS=" : ";
}
{
    for (i=1; i<=NF; i++) {
        gsub(/[[:space:]]/, "", $i);
        a[i,NR]=$i;
    }
    max=(max<NF?NF:max);
}
END {
    for (i=1; i<=max; i++) {
        if(i==1) printf "Filename;" 
        else printf FILENAME";";
        for (j=1; j<=NR; j++) printf "%s%s", a[i,j], (j==NR?RS:";");
    }
}
