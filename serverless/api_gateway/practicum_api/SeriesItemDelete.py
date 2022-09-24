from decimal import Decimal
from pprint import pprint
import boto3
from botocore.exceptions import ClientError

def delete_underrated_serie(title, series_id, rating):
    ydb_docapi_client = boto3.resource('dynamodb', endpoint_url = "https://docapi.serverless.yandexcloud.net/ru-central1/b1ghaq177q6g5noa48fh/etnde8n4h2h8mvlnb4ha")

    table = ydb_docapi_client.Table('docapitest/series')

    try:
        response = table.delete_item(
            Key = {
                'series_id': series_id,
                'title': title
            },
            ConditionExpression = "info.rating <= :val",
            ExpressionAttributeValues = {
                ":val": Decimal(rating)
            }
        )
    except ClientError as e:
        if e.response['Error']['Code'] == "ConditionalCheckFailedException":
            print(e.response['Error']['Message'])
        else:
            raise
    else:
        return response

if __name__ == '__main__':
    print("Попытка удаления записи...")
    delete_response = delete_underrated_serie("Supernatural", 3, 5)
    if delete_response:
        print("Данные о сериале удалены:")
        pprint(delete_response, sort_dicts = False)