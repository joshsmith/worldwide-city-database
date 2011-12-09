About
===

I found myself needing a database of city names for a side project. I needed to be able to do autocomplete using a jQuery UI front-end and some sort of fast backend.

The best thing I found out there was the MaxMind database. I took this data and hacked away at it, dropping some of their columns and adding another for a total of six columns: `combined` (for combined city+state/region names), `population`, `country_code`, `region`, `latitude`, and `longitude`.

The database presented here is a simple tab-delimited text file containing this data. It can be used anywhere you like. I use it in MySQL as follows:

MySQL Usage
===
To create the table, use the `createtable.sql` file.

To import this database you would do:

```mysql
mysql > LOAD DATA INFILE "/tmp/cities.sql" \
        INTO TABLE cities \
        FIELDS TERMINATED BY '\t' \
        LINES TERMINATED BY '\n' \
        (combined, population, country_code, region, latitude, longitude);
```

And to query the table for something like an autocomplete, you would do

```mysql
mysql > SELECT DISTINCT combined, latitude, longitude \
        FROM cities \
        WHERE combined LIKE "San Diego%" \
        ORDER BY population DESC, country_code DESC, region ASC;
```


License for MaxMind WorldCities Database
===

OPEN DATA LICENSE for MaxMind WorldCities and Postal Code Databases

Copyright (c) 2008 MaxMind Inc.  All Rights Reserved.

All advertising materials and documentation mentioning features or use of
this database must display the following acknowledgment:
"This product includes data created by MaxMind, available from
http://www.maxmind.com/"

Redistribution and use with or without modification, are permitted provided
that the following conditions are met:
1. Redistributions must retain the above copyright notice, this list of
conditions and the following disclaimer in the documentation and/or other
materials provided with the distribution. 
2. All advertising materials and documentation mentioning features or use of
this database must display the following acknowledgement:
"This product includes data created by MaxMind, available from
http://www.maxmind.com/"
3. "MaxMind" may not be used to endorse or promote products derived from this
database without specific prior written permission.

THIS DATABASE IS PROVIDED BY MAXMIND.COM ``AS IS'' AND ANY 
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL MAXMIND.COM BE LIABLE FOR ANY 
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
DATABASE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.