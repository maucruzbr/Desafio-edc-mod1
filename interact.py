import boto3
import os

# Criar um cliente para interagir com o AWS S3
s3_client = boto3.client('s3')

nome_bucket = 'edc-datalake-desafio-mod1'
diretorio = '.\data'

# Iteração nos arquivos do diretório

for filename in os.listdir(diretorio):
    caminho_arquivo = os.path.join(diretorio, filename)
    s3_client.upload_file(caminho_arquivo, nome_bucket, 'raw-data/rais'+filename)
