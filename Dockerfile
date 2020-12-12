FROM tensorflow/tensorflow:1.15.0-jupyter

ADD data /tf/data
ADD Inversion.ipynb /tf/

# install pylearn
RUN apt-get update 
RUN apt-get install -y build-essential 
RUN apt-get install -y liblapack-dev liblapack3 libopenblas-base libopenblas-dev
RUN apt-get install -y python2.7-dev python-numpy python-scipy python-setuptools git-core libyaml-dev python-yaml 
RUN apt-get install -y git-core

RUN pip install Pillow matplotlib Theano==0.6.0
RUN git clone git://github.com/lisa-lab/pylearn2.git /tmp/pylearn2
ADD 0001-removed-install-options-and-stdin-request.patch /tmp/pylearn2/setup.patch
WORKDIR /tmp/pylearn2

# git needs this to apply the patch
RUN git config --global user.name "dummy" && git config --global user.email "dummy@dummy.com"
RUN git am setup.patch
RUN pip install .

# install tzdata without userprompt
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y python-matplotlib python-scikits-learn
RUN pip install pandas 
