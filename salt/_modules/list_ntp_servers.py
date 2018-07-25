
def list_ntp_servers():
    # initialize a list to store the answer
    ntp_servers = []

    # read the config file into a list
    with open('/etc/ntp.conf') as f:
        lines = f.readlines()

    # loop through the list from the config file
    for line in lines:
        # identify the lines where the ntp servers are defined - starting with server and ending with iburst
        if (line.startswith('server') and line.split()[-1] == 'iburst'):
            ntp_servers.append( line.replace('server','').replace('iburst','').strip() )
        
    # return the answeer
    return {'ntp_servers': ntp_servers}
