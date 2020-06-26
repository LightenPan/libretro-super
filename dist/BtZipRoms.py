# encoding=utf8
import os
from tqdm import tqdm
import zipfile


def listdir(dst_dir, ext_list=None):  #传入存储的list
    xlist = list()
    for root, dirs, files in os.walk(dst_dir):
        # print(root) #当前目录路径
        # print(dirs) #当前路径下所有子目录
        # print(files) #当前路径下所有非目录子文件
        if ext_list:
            for file in files:
                ext = os.path.splitext(file)[-1]
                if ext not in ext_list:
                    continue
                xlist.append(os.path.join(root, file))
        else:
            for file in files:
                xlist.append(os.path.join(root, file))
    return xlist


def zip_dir(srcPath, dstName):
    import zipfile
    basename = os.path.basename(srcPath)
    f = zipfile.ZipFile(dstName,'w',zipfile.ZIP_DEFLATED)
    f.write(srcPath, basename)
    f.close()


if __name__ == "__main__":
    from optparse import OptionParser
    usage = 'python BtZipRoms.py --ext=.nds --roms= --use_splitext=0'
    parser = OptionParser(usage)
    parser.add_option("--roms")
    parser.add_option("--ext")
    parser.add_option("--use_splitext")

    (options, args) = parser.parse_args()

    if not options.use_splitext:
        options.use_splitext = 1
    else:
        options.use_splitext = int(options.use_splitext)

    rom_list = listdir(options.roms, [options.ext])

    index = 0
    pbar = tqdm(rom_list)
    for file in pbar:
        index = index + 1

        pbar.set_description(u"处理 %s" % file)
        pbar.update()

        if options.use_splitext == 1:
            dstname = os.path.splitext(file)[0] + '.zip'
        else:
            dstname = file + '.zip'
        if os.path.exists(dstname):
            continue
        zip_dir(file, dstname)

