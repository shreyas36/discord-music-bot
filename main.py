import discord
from discord.ext import commands
from youtube_dl import YoutubeDL
from music_cog import music_cog
from help_cog import help_cog
from configparser import ConfigParser
import os

# os.environ['Path'] = os.environ['Path'] + ';' + os.getcwd() + '/ffmpeg/bin'

# Read config file
config = ConfigParser()
config.read('token.ini')
token = config['DEFAULT']['token']

# intents = discord.Intents.all()
# intents.typing = False
# intents.presences = False
bot = commands.Bot(command_prefix='-')
bot.remove_command('help')

bot.add_cog(music_cog(bot))
bot.add_cog(help_cog(bot))
bot.run(token)
