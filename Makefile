SHELL := /bin/bash
PROJECT := $(shell basename $(shell pwd))

test_name = All_service
service_name = All_service
report_dir = $$(date +"__Reports__/year_%Y/month_%m/day_%d/%R")
init_report_dir_one = $$(date +"__Reports__/year_%Y/month_%m/day_%d/$(service_name)")
init_report_dir_two = report/
create_folder = md $(report_dir) || mkdir $(report_dir)
move_command_one = mv $(init_report_dir_one) $(report_dir) || move $(init_report_dir_one) $(report_dir)
move_command_two = cp -r $(init_report_dir_two) $(report_dir) || rmdir /s /q $(init_report_dir_two) $(report_dir)
remove_command = rm report/report.html || del /f report/report.html
service_rute = login/ControlPanel/

command = pytest $(service_rute)$(test_name)  || true
test_enter_datacenter = pytest login/ControlPanel/Cloud_Datacenter/test_cloud_datacenter.py::test_02_enter_data_center


help:
	@echo -e '\n\t'+-------------------------------------------------------------------------------------------------------------+
	@echo -e '\t\t' - Use: '"'make install_linux_env'"' to install the virtual environment and all dependencies in linux
	@echo -e '\t\t' - Use: '"'make install_linux_env'"' to install the virtual environment and all dependencies in windows

	@echo -e '\n\t\t' You can use these commands if you are in a virtual environment:
	@echo -e '\t\t\t' - Use: '"'make datacenter'"' to execute all test in datacenter
	@echo -e '\t\t\t' - Use: '"'make oracle'"' to execute all test in oracle
	@echo -e '\t\t\t' - Use: '"'make vmware'"' to execute all test in vmware
	@echo -e '\t\t\t' - Use: '"'make all'"' to execute all test for all service

	@echo -e '\n\t\t' - Use: '"'make command'"' to show report command
	@echo -e '\t\t' - Use: '"'make dir'"' to show dir report
	@echo -e '\t\t' - Use: '"'clear'"' clear terminal
	@echo -e '\t'+------------------------------------------------------------------------------------------------------------+



install_linux_env:
	@echo Se va a instalar firefox, chrome, pip, pipenv y se van a instalar todas las dependencias dentro del entorno virtual
	@sudo apt update && sudo apt upgrade
	@sudo apt install wget && wget -P / https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb
	@sudo apt install firefox
	@sudo apt install python3-pip
	@sudo pip install pipenv
	@pipenv install


install_windows_env:
	@echo Se va a instalar pip, pipenv y se van a instalar todas las dependencias dentro del entorno virtual



datacenter_new_cloudserver:
	$(eval service_name=Datacenter)
	$(eval test_name=Cloud_Datacenter/test_cloud_datacenter.py::test_01_add_new_cloudserver)
	@echo -e '\n\n------------------------------------------------------\n\n'
	@echo -e ' - ' $(command) '\n'
	@echo -e '\n\n------------------------------------------------------\n\n'
	@$(command)
	@echo -e '\n----------------Move reports to the same folder-------------------------\n'
	@echo -e ' - Create report folder \n'
	@echo -e ' - ' mkdir $(report_dir) '\n'
	@echo -e ' - ' $(move_command_one) '\n'
	@$(move_command_one)
	@echo -e ' - ' $(move_command_two) '\n'
	@$(move_command_two)
	@echo -e '\n------------------------------------------------------\n\n'


datacenter:
	$(eval service_name=Datacenter)
	$(eval test_name=Cloud_Datacenter/test_cloud_datacenter.py)
	@echo -e '\n\n------------------------------------------------------\n\n'
	@echo -e ' - ' $(command) '\n'
	@echo -e '\n\n------------------------------------------------------\n\n'
	@$(command)
	@echo -e '\n----------------Move reports to the same folder-------------------------\n'
	@echo -e ' - Create report folder \n'
	@echo -e ' - ' mkdir $(report_dir) '\n'
	@echo -e ' - ' $(move_command_one) '\n'
	@$(move_command_one)
	@echo -e ' - ' $(move_command_two) '\n'
	@$(move_command_two)
	@echo -e '\n------------------------------------------------------\n\n'


oracle:
	$(eval service_name=Oracle)
	$(eval test_name=Cloud_Server_Oracle/test_cloud_oracle.py)
	@echo -e '\n\n------------------------------------------------------\n\n'
	@echo -e ' - ' $(command) '\n'
	@echo -e '\n\n------------------------------------------------------\n\n'
	@$(command)
	@echo -e '\n----------------Move reports to the same folder-------------------------\n'
	@echo -e ' - Create report folder \n'
	@echo -e ' - ' mkdir $(report_dir) '\n'
	@echo -e ' - ' $(move_command_one) '\n'
	@$(move_command_one)
	@echo -e ' - ' $(move_command_two) '\n'
	@$(move_command_two)
	@echo -e '\n------------------------------------------------------\n\n'

vmware:
	$(eval service_name=VMware)
	$(eval test_name=Cloud_VMware/test_cloud_vmware.py)
	@echo -e '\n\n------------------------------------------------------\n\n'
	@echo -e ' - ' $(command) '\n'
	@echo -e '\n\n------------------------------------------------------\n\n'
	@$(command)
	@echo -e '\n----------------Move reports to the same folder-------------------------\n'
	@echo -e ' - Create report folder \n'
	@echo -e ' - ' mkdir $(report_dir) '\n'
	@echo -e ' - ' $(move_command_one) '\n'
	@$(move_command_one)
	@echo -e ' - ' $(move_command_two) '\n'
	@$(move_command_two)
	@echo -e '\n------------------------------------------------------\n\n'

all:
	@echo -e '\n\n------------------------------------------------------\n\n'
	@echo -e ' - ' $(command) '\n'
	@echo -e '\n\n------------------------------------------------------\n\n'
	@$(command)
	@echo -e '\n----------------Move reports to the same folder-------------------------\n'
	@echo -e ' - Create report folder \n'
	@echo -e ' - ' mkdir $(report_dir) '\n'
	@echo -e ' - ' $(move_command_one) '\n'
	@$(move_command_one)
	@echo -e ' - ' $(move_command_two) '\n'
	@$(move_command_two)
	@echo -e '\n------------------------------------------------------\n\n'


command:
	$(eval service_name=Example_service_name)
	@echo $(command)


dir:
	$(eval test_name=new_Value)
	@echo $(report_dir)


clear:
	clear

