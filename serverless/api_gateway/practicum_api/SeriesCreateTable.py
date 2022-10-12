import boto3

def create_series_table():
    ydb_docapi_client = boto3.resource('dynamodb', endpoint_url = "https://docapi.serverless.yandexcloud.net/ru-central1/b1ghaq177q6g5noa48fh/etnde8n4h2h8mvlnb4ha")

    table = ydb_docapi_client.create_table(
        TableName = 'docapitest/series', # Series — имя таблицы
        KeySchema = [
            {
                'AttributeName': 'series_id',
                'KeyType': 'HASH'  # Ключ партицирования
            },
            {
                'AttributeName': 'title',
                'KeyType': 'RANGE'  # Ключ сортировки
            }
        ],
        AttributeDefinitions = [
            {
                'AttributeName': 'series_id',
                'AttributeType': 'N'  # Целое число
            },
            {
                'AttributeName': 'title',
                'AttributeType': 'S'  # Строка
            },

        ]
    )
    return table

if __name__ == '__main__':
    series_table = create_series_table()
    print("Статус таблицы:", series_table.table_status)