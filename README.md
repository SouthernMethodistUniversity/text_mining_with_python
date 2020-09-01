# Text Mining With Python

## Running the Notebook via JupyterLab on M2

1.  Go to [hpc.smu.edu](https://hpc.smu.edu/)
2.  Sign in using your SMU ID and SMU password
3.  Select "ManeFrame II Shell Access" from the "Clusters" drop-down menu.
4.  Clone repository, `git clone https://github.com/SouthernMethodistUniversity/text_mining_with_python.git`.
5.  Change to repository directory, `cd text_mining_with_python`.
6.  Select "JupyterLab" from the "Interactive Apps" drop-down menu.
7. Set the "Additional environment modules to load" field to `environment`.
8. Set the "Custom module paths" field to `module use $HOME/text_mining_with_python`.
9. Select other options required for your Jupyter instance. These options are the
    same as those requested via a standard Slurm script on M2. For this tutorial:
    - Partition: `htc`
    - Number of hours: 3
    - Number of nodes: 1
    - Cores per node: 1
    - GPUs per node: 0
    - Memory: 6
10. Select "Launch"
11. Wait for the job to start on M2. When the job starts a new button "Connect
    to JupyterLab" button will appear.
12. Select "Connect to JupyterLab"
13. The JupyterLab graphical interface will be presented and running on the M2
    resource requested.
14. Double click the appropriate notebook to open it.
15. When finished using the JupyterLab instance, return to the "My
    Interactive Sessions" tab in your browser and select "Delete" and "Confirm",
    when prompted, to cancel the job on M2.

## Running the Notebook via JupyterLab via a Local Docker Installation

1. Install [Docker](https://docs.docker.com/get-docker/) and run commands below in terminal shell of your choice.
2. Clone repository, `git clone https://github.com/SouthernMethodistUniversity/text_mining_with_python.git`.
3. Change to repository directory, `cd text_mining_with_python`.
4. `docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $HOME:/home/jovyan rkalescky/text_mining_with_python:latest`
5. Copy and paste the last URL given into your web browser and the JupyterLab graphical interface will be presented.

