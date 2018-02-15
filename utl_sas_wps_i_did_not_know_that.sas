Translating bad ascii chars and sort without by statement and fcopy

see
https://goo.gl/xNW2SJ
https://github.com/rogerjdeangelis/utl_translating_bad_ascii_chars_and_sort_without_by_statement

Converting special ascii characters to base characters

*_                       _       _
| |_ _ __ __ _ _ __  ___| | __ _| |_ ___
| __| '__/ _` | '_ \/ __| |/ _` | __/ _ \
| |_| | | (_| | | | \__ \ | (_| | ||  __/
 \__|_|  \__,_|_| |_|___/_|\__,_|\__\___|

;
see
https://goo.gl/vk5pC2
https://communities.sas.com/t5/Base-SAS-Programming/Invalid-ASCII-character-in-name/m-p/437132

KSharp profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/18408


data have;
 want=basechar('JosÃ©');
 put want=;
run;

*              _
 _ __   ___   | |__  _   _
| '_ \ / _ \  | '_ \| | | |
| | | | (_) | | |_) | |_| |
|_| |_|\___/  |_.__/ \__, |
                     |___/
;

SAS Forum: proc sort without a by statement - I did not know that

These two sorts produce the same result

      proc sort data = have out=havSrt;
        key species / ascending;
        key class / descending;
      run;quit;

      proc sort data = have out=havSrt;
      by  species descending class;
      run;


https://goo.gl/RfQqSM
https://communities.sas.com/t5/Base-SAS-Programming/problem-with-the-program/m-p/437066

makset7 profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/51900


INPUT
=====

DATA HAVE;
INPUT species  class;
cards4;
1 7
1 4
1 5
1 6
1 3
2 2
1 1
2 4
2 1
2 3
2 5
2 7
1 2
2 6
3 3
3 7
;;;;
run;quit;


PROCESSES
=========

proc sort data = have out=havSrt;
  key species / ascending;
  key class / descending;
run;

proc sort data = have out=havSrt;
by  species descending class;
run;

OUTPUT
======

WANT.HAVSRT total obs=16

  SPECIES    CLASS

     1         7
     1         6
     1         5
     1         4
     1         3
     1         2
     1         1
     2         7
     2         6
     2         5
     2         4
     2         3
     2         2
     2         1
     3         7
     3         3

* __
 / _| ___ ___  _ __  _   _
| |_ / __/ _ \| '_ \| | | |
|  _| (_| (_) | |_) | |_| |
|_|  \___\___/| .__/ \__, |
              |_|    |___/
;

Example 2: Copying a Binary File
This example copies a binary file from one directory to another.
Setting the MSGLEVEL= system option to I causes informational
messages from FCOPY to be written to the log.

/* Set MSGLEVEL to I to write messages from FCOPY to the log. */
options msglevel=i;

filename fro 'd:/xls/class.xlsx' recfm=n;
filename too 'd:/xls/class2.xlsx' recfm=n;

%utlfkil(d:/xls/class.xlsx);
libname xel "d:/xls/class.xlsx";
data xel.class;
  set sashelp.class;
run;quit;
libname xel clear;

data _null_;
   length msg $ 384;
   rc=fcopy('fro', 'too');
   if rc=0 then
      put 'Copied FRO to TOO';
   else do;
      msg=sysmsg();
      put rc= msg=;
   end;
run;


