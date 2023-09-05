#!/usr/bin/python
import os,sys, re
fn = open(sys.argv[1],'r')
fw = open(sys.argv[2],'w')
path1=os.getcwd()
print path1
document_list=[]
all_seq = {}
for linek in fn:
    linek = linek.rstrip("\n")
    all_seq[linek] = ""
fn.close()
for i in os.listdir(path1):
    if os.path.isdir(i):
        continue
    else:
        if '.single.txt_muscleout' in i:
            document_list.append(i)
        else:
            continue
def get_samplename(str1):
    return (str1[0:str1.index('.single.txt_muscleout')])
for item in document_list:
    f = open(item,'r')
    name = get_samplename(item)
    seq = {}
    for line in f:
        line = line.rstrip("\n")
        if line.startswith('>'):
            query0 = line.split(">")[1]
            query = query0.split("|")[0]
            seq[query] = ""
        else:
            seq[query] += line
    f.close()
    for line2 in seq.keys():
        seq_con = seq[line2]
        all_seq[line2]+=seq_con
for all_key in all_seq.keys():
    bbb=re.findall(r'.{60}',all_seq[all_key])
    ccc='\n'.join(bbb)
    fw.write(">")
    fw.write(all_key)
    fw.write("\n")
    fw.write(ccc)
    fw.write("\n")
