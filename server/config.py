import os

config_viktor = {
  'db_host': '127.0.0.1',
  'db_port': '8889'
}

config_niclas = {
  'db_host': '127.0.0.1',
  'db_port': '3306'
}

def get_config():
  if (os.environ.get('COMPUTER_NAME') == 'nizze_dev'):
    return config_niclas
  return config_viktor

conf = get_config()
