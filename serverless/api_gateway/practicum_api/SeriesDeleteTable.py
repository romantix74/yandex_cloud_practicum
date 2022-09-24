import boto3

def delete_serie_table():
    ydb_docapi_client = boto3.resource('dynamodb', endpoint_url = "https://docapi.serverless.yandexcloud.net/ru-central1/b1ghaq177q6g5noa48fh/etnde8n4h2h8mvlnb4ha")

    table = ydb_docapi_client.Table('docapitest/series')
    table.delete()

if __name__ == '__main__':
    delete_serie_table()
    print("Таблица Series удалена")