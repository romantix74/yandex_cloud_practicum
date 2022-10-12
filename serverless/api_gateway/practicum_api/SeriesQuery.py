from pprint import pprint
import boto3
from boto3.dynamodb.conditions import Key


def query_and_project_series(series_id, title_range):
    ydb_docapi_client = boto3.resource('dynamodb', endpoint_url="https://docapi.serverless.yandexcloud.net/ru-central1/b1ghaq177q6g5noa48fh/etnde8n4h2h8mvlnb4ha")

    table = ydb_docapi_client.Table('docapitest/series')

    response = table.query(
        ProjectionExpression="series_id, title, info.release_date",
        KeyConditionExpression=Key('series_id').eq(series_id) & Key('title').begins_with(title_range)
    )
    return response['Items']


if __name__ == '__main__':
    query_id = 3
    query_range = 'T'
    print(f"Сериалы с id = {query_id} и названием на букву "
          f"{query_range}")
    series = query_and_project_series(query_id, query_range)
    for serie in series:
        print(f"\n{serie['series_id']} : {serie['title']}")
        pprint(serie['info'])