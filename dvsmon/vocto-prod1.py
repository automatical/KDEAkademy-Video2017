# vocto-prod1.py

# dvs-mon config to run voctomix in production:
# core, gui, camera, cut, save
# remote video feeds are run out side of this set.

def main(COMMANDS,conf):
    print(conf)
    COMMANDS.append( Command('voctocore -vv'))
    COMMANDS.append( Command('voctogui -vv'))
    COMMANDS.append( Command('ssh pi@raspicam1 sh video.sh'))
    COMMANDS.append( Command('ssh pi@raspicam1 sh audio.sh'))
    COMMANDS.append( Command('sh ../pipeline-scripts/raspicam1/ingest.sh'))
    COMMANDS.append( Command('ssh pi@raspicam2 sh video.sh'))
    COMMANDS.append( Command('sh ../pipeline-scripts/raspicam2/ingest.sh'))
    COMMANDS.append( Command('sh ../pipeline-scripts/framegrabber/framegrabber.sh'))
    COMMANDS.append( Command('sh ../pipeline-scripts/background/background.sh'))
    COMMANDS.append( Command('sh ../pipeline-scripts/filesink/sink.sh'))
    COMMANDS.append( Command('sh ../pipeline-scripts/comfort/comfort.sh'))

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
