import pymysql


class DB:
    def getConnection():
        # 例外処理
        try:
            conn = pymysql.connect(
                host="database-1.c5brxq7fwjz6.ap-northeast-1.rds.amazonaws.com",
                db="Wadachi",
                user="gruper",
                password="Spring_e6",
                charset="utf8",
                cursorclass=pymysql.cursors.DictCursor
            )
            return conn
        # エラー表示
        except (ConnectionError):
            print("コネクションエラーです")
            conn.close()
