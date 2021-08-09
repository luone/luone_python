from Crypto.Cipher import AES
import execjs
from js import decory_video_js


class Video:
    def __init__(self):
        pass

    def decory(self, play_key, lesson_id, data):
        lesson_id = str(lesson_id)
        key = self.decory_video_key(play_key, lesson_id)
        bs = AES.block_size
        if len(data) <= bs:
            return (data)
        #unpad = lambda s: s[0:-ord(s[-1])]
        unpad = lambda s: s[0:-s[-1]]
        iv = data[:bs]
        #cipher = AES.new(key, AES.MODE_ECB, iv)
        cipher = AES.new(key, AES.MODE_ECB)
        data = unpad(cipher.decrypt(data[bs:]))
        return (data)

    def decory_video_key(self, key, lesson_id):
        ctx = execjs.compile(decory_video_js.decorypt_js())
        return ctx.call("decode", key, lesson_id)
