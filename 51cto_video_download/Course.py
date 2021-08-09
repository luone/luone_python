# encoding=utf-8
from cto import Login, lesson
from cto import tools


def run(ss):
    try:
        print("如果要更改下载路径，请移步文件：Decory_video.py> download()!")
        lesson.Lesson(ss).set_course_id_by_course_list().lesson_list().download()
    except KeyboardInterrupt:
        print
        print('程序退出')
        exit(0)


if __name__ == '__main__':
    run('NULL')

