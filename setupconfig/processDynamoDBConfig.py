import json
import boto3
import exputils

def processData(data):
    for d in data:
        print(d['Table'])
        print(d['Data'])
        if (d['Table'] == "RESTABLE"):
            processResTableData(d['Table'], d['Data'])
        else:
            processTableData(d['Table'], d['Data'])

def processTableData(tablename, data):
#    tablename = data['Dynamodb'][0]['Table']
    records = data
    dynamodb = boto3.resource('dynamodb')

    for rec in records :
        print(rec)
        fieldname = rec['FIELDTAG']
        fieldvalue = rec['FIELDNAME']
        print( fieldname + " " + fieldvalue)
        l_table = dynamodb.Table(tablename)
        l_table.put_item(Item={'FIELDTAG':fieldname,'FIELDNAME':fieldvalue})

def processResTableData(tablename, data):
    records = data
    #dynamodb = boto3.resource('dynamodb', aws_access_key_id='AKIAVBRTAL5UYA7MKFVH',
    #                      aws_secret_access_key='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', region_name='us-east-1')
    dynamodb = boto3.resource('dynamodb')

    for rec in records :
        print(rec)
        fieldname = rec['RESKEY']
        fieldvalue = rec['RESNAME']
        fieldtype = rec['RESTYPE']
        print( fieldname + " " + fieldvalue)
        l_table = dynamodb.Table(tablename)
        l_table.put_item(Item={"RESKEY":fieldname,"RESNAME":fieldvalue,"RESTYPE": fieldtype})


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    f = open('C:\Abhay\Personal\AWS\AbgSept2022\Scripts\DynamoDB-table-data.json')
    data = json.load(f)
    processData(data['Dynamodb'])

def updateDBEndpoint():
    rds = boto3.client('rds')
    dbs = rds.describe_db_instances()
    print(dbs['DBInstances'][0]['Endpoint']['Address'])
    dynamodb = boto3.resource('dynamodb')
    l_table = dynamodb.Table("RESTABLE")
    l_table.put_item(Item={"RESKEY": "DBURL", "RESNAME": dbs['DBInstances'][0]['Endpoint']['Address'], "RESTYPE": "RDS"})
