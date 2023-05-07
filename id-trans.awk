BEGIN {
    FS = ",";
    a[0,0] = "A";    a[0,1] = 1;    a[0,2] = 0;    a[0,3] = 1;
    a[1,0] = "B";    a[1,1] = 1;    a[1,2] = 1;    a[1,3] = 0;
    a[2,0] = "C";    a[2,1] = 1;    a[2,2] = 2;    a[2,3] = 9;
    a[3,0] = "D";    a[3,1] = 1;    a[3,2] = 3;    a[3,3] = 8;
    a[4,0] = "E";    a[4,1] = 1;    a[4,2] = 4;    a[4,3] = 7;
    a[5,0] = "F";    a[5,1] = 1;    a[5,2] = 5;    a[5,3] = 6;
    a[6,0] = "G";    a[6,1] = 1;    a[6,2] = 6;    a[6,3] = 5;
    a[7,0] = "H";    a[7,1] = 1;    a[7,2] = 7;    a[7,3] = 4;
    a[8,0] = "I";    a[8,1] = 3;    a[8,2] = 4;    a[8,3] = 9;
    a[9,0] = "J";    a[9,1] = 1;    a[9,2] = 8;    a[9,3] = 3;
    a[10,0] = "K";    a[10,1] = 1;    a[10,2] = 9;    a[10,3] = 2;
    a[11,0] = "M";    a[11,1] = 2;    a[11,2] = 1;    a[11,3] = 1;
    a[12,0] = "N";    a[12,1] = 2;    a[12,2] = 2;    a[12,3] = 0;
    a[13,0] = "O";    a[13,1] = 3;    a[13,2] = 5;    a[13,3] = 8;
    a[14,0] = "P";    a[14,1] = 2;    a[14,2] = 3;    a[14,3] = 9;
    a[15,0] = "Q";    a[15,1] = 2;    a[15,2] = 4;    a[15,3] = 8;
    a[16,0] = "T";    a[16,1] = 2;    a[16,2] = 7;    a[16,3] = 5;
    a[17,0] = "U";    a[17,1] = 2;    a[17,2] = 8;    a[17,3] = 4;
    a[18,0] = "V";    a[18,1] = 2;    a[18,2] = 9;    a[18,3] = 3;
    a[19,0] = "W";    a[19,1] = 3;    a[19,2] = 2;    a[19,3] = 1;
    a[20,0] = "X";    a[20,1] = 3;    a[20,2] = 0;    a[20,3] = 3;
    a[21,0] = "Z";    a[21,1] = 3;    a[21,2] = 3;    a[21,3] = 0;
}
{
    for (i = 0; i < 22; i++) {
        k = t(a[i,0], a[i,1], a[i,2], $1, $2, $3, $4, $5, $6, $7, $8);
        if (k != -1)
            printf("%s%d%d%d%d%d%d%d%d%d\n", a[i,0], $1, $2, $3, $4, $5, $6, $7, $8, k);
    }
}
END {
}
function t(n1, n2, a, b, c, d, e, f, g, h, j) {
    for (k = 0; k < 10; k++) {
        p = n1 + n2 * 9 + a * 8 + b * 7 + c * 6 + d * 5 + e * 4 + f * 3 + g * 2 + h + k;
        if (p % 10 == 0)
            return k;
    }
    return -1;
}