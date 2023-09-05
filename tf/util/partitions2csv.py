import hcl2
import subprocess
import shlex
import sys
from datetime import datetime
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("tfvars", help="The tfvars file to parse",
                    type=str)
args = parser.parse_args()

# datetime object containing current date and time
now = datetime.now()
# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")

with open(args.tfvars, 'r') as fp:
    obj = hcl2.load(fp)

exclude = ['node_conf']

# Get the current git sha
proc = subprocess.run(shlex.split("git rev-parse --short HEAD"),stdout=subprocess.PIPE,stderr=subprocess.PIPE)
git_sha = proc.stdout.decode().strip()

# Get attributes
attributes = ['git_sha','date_checked','partition_name']
template = obj['partitions'][0]['partition_nodes'][0]
for k in template.keys():
    if not k in exclude:
        if type(template[k]) is dict:
            for tk in template[k].keys():
                attributes.append("{}.{}".format(k,tk))
        elif type(template[k]) is list:
            pass
        elif template[k] is None and k == 'gpu':
                attributes.append("{}.{}".format(k,'type'))
                attributes.append("{}.{}".format(k,'count'))

        else:
            attributes.append(k)
print(", ".join(attributes))

partitions = obj['partitions']
for p in partitions:
    for n in p['partition_nodes']:
        attributes = [git_sha, dt_string, p['partition_name']]
        for k in template.keys():
            if not k in exclude:
                if type(template[k]) is dict:
                    for tk in template[k].keys():
                        attributes.append(str(n[k][tk]))
                elif type(template[k]) is list:
                    pass
                elif template[k] is None and k == 'gpu':
                    if n[k] is None:
                        attributes.append("")
                        attributes.append("0")
                    else:
                        attributes.append(n[k]['type'])
                        attributes.append(str(n[k]['count']))
                else:
                    attributes.append(str(n[k]))

    print(", ".join(attributes))

#    print("{}, {}\n".format(p['partition_name'], p['partition_nodes'][0]['machine_type']))
#    print(p['partition_nodes'][0].keys())
#    print(p['partition_name'])
#    print(p['partition_nodes'][0]['machine_type'])
