import re
import sys
import datetime
import pandas as pd
from lxml import etree


def get_path_names(tree, type_):
    """ Finds the path names and isolates based on user """
    path_names = []
    path_list = []
    count = 0
    for element in tree.xpath("//name"):
        if element.text != '/':
            if type_[count - 1] == 'FILE':

                new_string = "".join(path_list[1] + "/{}".format(element.text))
                path_list.append(new_string)
                path_names.clear()
                path_names.append(new_string)
                count = count + 1
            else:
                path_names.append('/{}'.format(element.text))
                new_string = "".join(path_names)
                path_list.append(new_string)
                count = count + 1
        else:
            # path_names.append(element.text)
            new_string = "".join(path_names)
            path_list.append(new_string)
            count = count + 1

    df['Path'] = path_list


def calc_val_bits(bits, val):
    """ Calculates the val_bits based on the permission val """
    octave = {'0': '000', '1': '001', '2': '010', '3': '011',
              '4': '100', '5': '101', '6': '110', '7': '111'}
    rwx = {'000': '---', '001': '--x', '010': '-w-', '011': '-wx',
           '100': 'r--', '101': 'r-x', '110': 'rw-', '111': 'rwx'}
    for int_ in val:
        bits += rwx[octave[int_]]
    return bits


def get_mtime(tree):
    """ Takes the mtime property and converts it to a readable time within the table """
    mtime = [element.text for element in tree.xpath("//mtime")]

    mtime_fixed = []
    for time in mtime:
        mtime_formatted = str(
            datetime.datetime.utcfromtimestamp(int(time)/1e3))
        mtime_fixed.append(re.search('.*:.*:', mtime_formatted).group(0)[0:-1])

    df['ModificationTime'] = mtime_fixed


def get_fb_size(tree, type_):
    """ Finds the number of bytes to represent file size which determines the block count """
    size_list = [element for element in tree.xpath("//numBytes")]
    file_size = []
    block_list = []

    count = 0
    for i in range(len(type_)):
        if type_[i] == 'FILE':
            file_size.append(size_list[count].text)
            count = count + 1
        else:
            file_size.append(0)

    for size in file_size:
        if size == 0:
            block_list.append(0)
        else:
            block_list.append(1)

    df['BlockCount'] = block_list
    df['FileSize'] = file_size


def get_permissions(tree, type_):
    replication = [element.text for element in tree.xpath("//replication")]
    permission = [element.text for element in tree.xpath("//permission")]

    permission_split = []
    val = []
    val_bits = []
    for i in range(len(permission)):
        permission_split.append(permission[i].split(':'))
        val.append(permission_split[i][2])
        val[i] = val[i][1:]
        if type_[i] == 'FILE':
            val_bits.append(calc_val_bits('-', val[i]))
        else:
            val_bits.append(calc_val_bits('d', val[i]))

    df['Permissions'] = val_bits


if __name__ == '__main__':
    # Making the dataframe for the tsv file later on
    df = pd.DataFrame()
    file_path = sys.argv[1]
    tsv_name = sys.argv[2]

    # Establishing tree and sub-elements
    tree = etree.parse(file_path)
    type_ = [element.text for element in tree.xpath("//type")]

    # Getting the path names
    get_path_names(tree, type_)

    # Getting modification time
    get_mtime(tree)

    # Getting the file size and block count
    get_fb_size(tree, type_)

    # Getting the permissions
    get_permissions(tree, type_)

    # Converting the Pandas df to a tsv file
    df.set_index('Path')
    df.to_csv(tsv_name, sep='\t')
