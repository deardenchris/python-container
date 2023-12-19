
#Pull conda from image
FROM continuumio/miniconda3
RUN conda update conda

WORKDIR /python_test

#Copy everything over to the image
COPY ./ .

RUN conda env create -f environment.yml

# Make RUN commands use the new conda environment:
SHELL ["conda", "run", "-n", "pythontest", "/bin/bash", "-c"]

RUN pip install python-openstackclient

