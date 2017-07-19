# vocto-prod1.py

# dvs-mon config to run voctomix in production:
# core, gui, camera, cut, save
# remote video feeds are run out side of this set.

def main(COMMANDS,conf):
    print(conf)
    COMMANDS.append( Command('voctocore -vv'))
    COMMANDS.append( Command('voctogui -vv'))
    COMMANDS.append( Command('ssh pi@raspicam1 sh ingestvideo.sh'))
    COMMANDS.append( Command('sh ingest-picam-1.sh'))
    COMMANDS.append( Command('record-mixed-ffmpeg-segmented-timestamps.sh'))

    return


def get_conf():

    import ConfigParser, os

    config = ConfigParser.RawConfigParser()
    files=config.read(os.path.expanduser('~/veyepar.cfg'))
    try:
        print(files)
        conf=dict(config.items('global'))
        dest_path = os.path.expanduser(
                '~/Videos/veyepar/{client}/{show}/dv/{room}'.format(**conf))
    except KeyError:
        dest_path = os.path.expanduser(
                '~/Videos/voctomix')
    except ConfigParser.NoSectionError:
        dest_path = os.path.expanduser(
                '~/Videos/voctomix')

    ret = {'dest_path':dest_path,
            }

    return ret

conf = get_conf()
main(COMMANDS,conf)
