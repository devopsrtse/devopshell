#!/bin/bash

#The above command will describe it is a shell scripting file other than a normal file
###################
#Author: Sundar M
# Date: 02 JAN 2023

#This script will share the aws resource usage in our aws account 
#AWS S3
#AWS EC2
#AWS LAMBDA
#AWS IAM USERS

####################

#The set -x command will turn on  the debug mode (list the commands before executing )

set -x

#list number of  s3 buckets
echo "Print list of s3  buckets"
aws s3 ls >> resourcetracker.txt 


#list ec2 instances
echo "Print list of EC2 instances"

aws ec2 describe-instances  |  jq '.Reservations[].Instances[].InstanceId' >>resourcetracker.txt

#the above command output is piped into jq file (which extracts the data from the json file) and filter the output if needed

#list lambda
echo "Print list of lambda functions"

aws lambda list-functions >> resourcetracker.txt


#List IAM users

echo "Print list of IAM users"

aws iam list-users >> resourcetracker.txt

#List Groups

echo "Print list of gruops"

aws iam list-groups >> resourcetracker.txt


#on every code the output is redirected to save into a file called resourcetracker.txt  on a periodic basis 

#This file is executed at our required time automativcally by using the CRONTAB feature .




