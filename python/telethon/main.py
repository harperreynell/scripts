import telethon.sync
import configparser
import datetime
from telethon import TelegramClient
from telethon.tl.functions.messages import GetHistoryRequest, GetDialogsRequest
from telethon.tl.types import PeerChannel

config = configparser.ConfigParser()
config.read("config.ini")

api_id = config['Telegram']['api_id']
api_hash = config['Telegram']['api_hash']

api_hash = str(api_hash)

phone = config['Telegram']['phone']
username = config['Telegram']['username']

f = open("result.txt", "w")
l = open("links.dat", "r")

lines = l.readlines()

for i in range(len(lines)):
	with TelegramClient(username, api_id, api_hash) as client:
	    user_input_channel = lines[i]
	    if user_input_channel.isdigit():
                entity = PeerChannel(int(user_input_channel))
	    else:
                entity = user_input_channel	


	    history = client(GetHistoryRequest(
	    peer=client.get_entity(entity),
	    offset_id=0,
	    offset_date=None,
	    add_offset=0,
	    limit=100,
	    max_id=0,
	    min_id=0,
	    hash=0
	    ))
	    
	    

	    messages = history.messages
	    
	    f.write("\n")
	    f.write(str(lines[i]))
	    f.write("\n")
	    
	    for message in messages:
                if message.message == None:
                    break
                f.write(str(message.date) + ' ')
                f.write(message.message + ' ')
                f.write("\n")

