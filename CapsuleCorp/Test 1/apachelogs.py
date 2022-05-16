#!/usr/bin/python3.9
#
# Usage:
#     apachelogs.py <<specify a valid file path>>
#
# Example:
#     python3 apachelogs.py puppet_access_ssl.log

import sys
import re

def report(logfile):
    count_task_1 = 0
    count_task_2 = 0
    count_task_3 = 0
    count_task_4 = 0
    count_task_5 = 0
    for line in logfile:
        split_line = line.split()
        request_path = split_line[6]
        apache_status = split_line[8]
        request_type = split_line[5]
        ip_address = split_line[0]
        if "/production/file_metadata/modules/ssh/sshd_config" in request_path:
            count_task_1 += 1
            if apache_status != "200":
                count_task_2 += 1
        if apache_status != "200":
            count_task_3 += 1
        if "/dev/report/" in request_path and "PUT" in request_type:
            count_task_4 += 1
            if 6 < len(ip_address) <= 15:
                # Increase by 1 if IP exists; else set hit count = 1
                count_task_5 += 1
    #task 1 && 2 ##How many times the URL "/production/file_metadata/modules/ssh/sshd_config" was fetched
    #task 2 ##Of those requests, how many times the return code from Apache was not 200
    print("-- URL ~/sshd_config was fetched: " + str(count_task_1) + " times, Apache code != 200 is: " + str(count_task_2))
    #task 3 ##The total number of times Apache returned any code other than 200
    print("-- Apache returned any code other than 200: " + str(count_task_3))
    #task 4 ##The total number of times that any IP address sent a PUT request to a path under "/dev/report/"
    print("-- With path /dev/report/ and PUT type counter: " + str(count_task_4))
    #task 5 ##A breakdown of how many times such requests were made by IP address
    print("-- How many ties request by IP: " + str(count_task_5))

if __name__ == "__main__":
    if not len(sys.argv) > 1:
        print (__doc__)
        sys.exit(1)
    infile_name = sys.argv[1]
    try:
        infile = open(infile_name, 'r')
    except IOError:
        print ("You must specify a valid file to parse")
        print (__doc__)
        sys.exit(1)
    report(infile)
    infile.close()
