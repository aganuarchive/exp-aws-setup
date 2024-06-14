import os
import sys
import boto3
from boto3.dynamodb.conditions import Key

def handler(event, context):
    print(event)
    arr=os.listdir()
    print(arr)
    bucket = ""
    key=""

    dynamo = boto3.resource('dynamodb')
    l_table = dynamo.Table("RESTABLE")
    response = l_table.query(KeyConditionExpression=Key('RESKEY').eq("DBURL"))

    dburl = response['Items'][0]['RESNAME'] 
    print("dburl -> " + dburl )
    if ("ResultPath" in event):
        bucket = event['ResultPath']['payload']['EventBridge']['detail']['bucket']['name']
        print(bucket)
        key=event['ResultPath']['payload']['EventBridge']['detail']['object']['key']
        print(key)
    else:
        bucket = event['Records'][0]['s3']['bucket']['name']
        key = event['Records'][0]['s3']['object']['key']


    print(bucket)
    print(key)
    os.system('ls > /tmp/dir.log')
    s3 = boto3.client('s3')
    s3.download_file(bucket, key, '/tmp/DUMP.sql')    
    s3.download_file(bucket, key, '/tmp/dropdb.sql')
    s3.download_file(bucket, 'modifydump.sh', '/tmp/modifydump.sh')    
    s3.download_file(bucket, 'rundropdb.sh', '/tmp/rundropdb.sh')    
    s3.download_file(bucket, 'runimport.sh', '/tmp/runimport.sh')    
    os.system('chmod 777 /tmp/*')
    arr=os.listdir("/tmp/")
    print(arr)

    os.system('sh /tmp/modifydump.sh /tmp/DUMP.sql')
    s3.upload_file('/tmp/DUMP.sql', 'atest170524', '/dumplogs/DUMP.sql')
    os.system('sh /tmp/rundropdb.sh  ' + dburl + '  > /tmp/rundropdb.log') 
    os.system('sh /tmp/runimport.sh  ' + dburl + ' > /tmp/runimport.log')
    s3.upload_file('/tmp/runimport.log', bucket, '/dumplogs/runimport.log')
    arr=os.listdir("/tmp/")
    print(arr)
    return 'db process complete' 