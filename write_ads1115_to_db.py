import mysql.connector
import sys

db = mysql.connector.connect(user = 'miller', password = 'tnJddWE7xR9wsCc', host = 'kyb293.biologie.uni-bielefeld.de', database = 'miller')
cursor = db.cursor()

for line in sys.stdin:
    line = line.replace("\n","")
    print(line)
    tokens = line.split(" ")
    if len(tokens) != 5:
        continue
    cursor.execute("INSERT INTO ads1115 (t, channel0, channel1, channel2, channel3) VALUES (%s, %s, %s, %s, %s)", (tokens[0], tokens[1], tokens[2], tokens[3], tokens[4]))
    db.commit()

