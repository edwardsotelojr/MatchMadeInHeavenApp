//
//  birthChart.c
//  MatchMadeInHeavenApp
//
//  Created by Edward Sotelo Jr on 6/19/19.
//  Copyright © 2019 Edward Sotelo Jr. All rights reserved.
//

#include "birthChart.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char chineseDate[5] = "";
char* getBirthChart(int month, int day, int year){
    char mon[15] = "";
    switch (month) {
        case 0:
            strcat(mon, "JANUARY");
            break;
        case 1:
            strcat(mon, "FEBRUARY");
            break;
        case 2:
            strcat(mon, "MARCH");
            break;
        case 3:
            strcat(mon, "APRIL");
            break;
        case 4:
            strcat(mon, "MAY");
            break;
        case 5:
            strcat(mon, "JUNE");
            break;
        case 6:
            strcat(mon, "JULY");
            break;
        case 7:
            strcat(mon, "AUGUST");
            break;
        case 8:
            strcat(mon, "SEPTEMBER");
            break;
        case 9:
            strcat(mon, "OCTOBER");
            break;
        case 10:
            strcat(mon, "NOVEMBER");
            break;
        case 11:
            strcat(mon, "DECEMBER");
            break;
        default:
            break;
    }
    char filename[150] = "";
    char yearr[5] = "";
    strcat(filename, "file:///var/containers/Bundle/Application/5FD87A1E-C459-49C3-BE69-94FCCA03E297/MatchMadeInHeavenApp.app/Ephemerides/");
    sprintf(yearr, "%d", year);
    strcat(filename, yearr);
    strcat(filename, ".txt");
    static char line[100];
    FILE* file;
    file = fopen(filename, "r");
    if(file == NULL){
        printf("error: ()");
        printf("%s", filename);
    }else{
        fgets(line, 40, file);
        for(int i = 0; i < 5; i++){
            chineseDate[i] = line[i+13];
        }
        rewind(file);
        while(fgets(line, 100, file)){
            if(strstr(line,mon) != 0){
                break;
            }
        }
    
        if (day < 10){
            while(fgets(line, 100, file)){
                if(line[3] == '0'){
                    int i = line[4] - '0';
                    if(i == day){
                        return line;
                    }
                }
            }
        }else if(day>9 && day < 20){
            while(fgets(line, 100, file)){
                if(line[3] == '1'){
                    int i = line[4] - '0';
                    if(i == (day%10)){
                        return line;
                    }
                }
            }
        }else if (day > 19 && day < 30) {
            while(fgets(line, 100, file)){
                if(line[3] == '2'){
                    int i = line[4] - '0';
                    if(i == (day%20)){
                        return line;
                    }
                }
            }
        }else if (day > 29 && day < 32){
            while(fgets(line, 100, file)){
                if(line[3] == '3'){
                int i = line[4] - '0';
                if(i == (day%30)){
                    return line;
                }
            }
        }
    }
        
    }
    
    fclose(file);
    return line;
}

char* getSun(char birthChart[100]){
    static char sunSign[10] = "";
    sunSign[0] = birthChart[17];
    sunSign[1] = birthChart[18];
    sunSign[2] = birthChart[15];
    sunSign[3] = birthChart[16];
    sunSign[4] = birthChart[19];
    sunSign[5] = birthChart[20];
    return sunSign;
}
char* getMoon(char birthChart[100]){
    static char moonSign[10] = "";
    moonSign[0] = birthChart[24];
    moonSign[1] = birthChart[25];
    moonSign[2] = birthChart[22];
    moonSign[3] = birthChart[23];
    moonSign[4] = birthChart[26];
    moonSign[5] = birthChart[27];
    return moonSign;
}
char* getMercury(char birthChart[100]){
    static char mercurySign[10] = "";
    mercurySign[0] = birthChart[31];
    mercurySign[1] = birthChart[32];
    mercurySign[2] = birthChart[29];
    mercurySign[3] = birthChart[30];
    mercurySign[4] = birthChart[33];
    mercurySign[5] = birthChart[34];
    return mercurySign;
}

char* getVenus(char birthChart[100]){
    static char venusSign[10] = "";
    venusSign[0] = birthChart[38];
    venusSign[1] = birthChart[39];
    venusSign[2] = birthChart[36];
    venusSign[3] = birthChart[37];
    venusSign[4] = birthChart[40];
    venusSign[5] = birthChart[41];
    return venusSign;
}

char* getMars(char birthChart[100]){
    static char marsSign[10] = "";
    marsSign[0] = birthChart[45];
    marsSign[1] = birthChart[46];
    marsSign[2] = birthChart[43];
    marsSign[3] = birthChart[44];
    marsSign[4] = birthChart[47];
    marsSign[5] = birthChart[48];
    return marsSign;
}

char* getJupiter(char birthChart[100]){
    static char jupiterSign[10] = "";
    jupiterSign[0] = birthChart[52];
    jupiterSign[1] = birthChart[53];
    jupiterSign[2] = birthChart[50];
    jupiterSign[3] = birthChart[51];
    jupiterSign[4] = birthChart[54];
    jupiterSign[5] = birthChart[55];
    return jupiterSign;
}

char* getSaturn(char birthChart[100]){
    static char saturnSign[10] = "";
    saturnSign[0] = birthChart[59];
    saturnSign[1] = birthChart[60];
    saturnSign[2] = birthChart[57];
    saturnSign[3] = birthChart[58];
    saturnSign[4] = birthChart[61];
    saturnSign[5] = birthChart[62];
    return saturnSign;
}

char* getUranus(char birthChart[100]){
    static char uranusSign[10] = "";
    uranusSign[0] = birthChart[66];
    uranusSign[1] = birthChart[67];
    uranusSign[2] = birthChart[64];
    uranusSign[3] = birthChart[65];
    uranusSign[4] = birthChart[68];
    uranusSign[5] = birthChart[69];
    return uranusSign;
}

char* getNeptune(char birthChart[100]){
    static char neptuneSign[10] = "";
    neptuneSign[0] = birthChart[73];
    neptuneSign[1] = birthChart[74];
    neptuneSign[2] = birthChart[71];
    neptuneSign[3] = birthChart[72];
    neptuneSign[4] = birthChart[75];
    neptuneSign[5] = birthChart[76];
    return neptuneSign;
}

char* getPluto(char birthChart[100]){
    static char plutoSign[10] = "";
    plutoSign[0] = birthChart[80];
    plutoSign[1] = birthChart[81];
    plutoSign[2] = birthChart[78];
    plutoSign[3] = birthChart[79];
    plutoSign[4] = birthChart[82];
    plutoSign[5] = birthChart[83];
    return plutoSign;
}

char* getChineseNewYearDate(){
    return chineseDate;
}
