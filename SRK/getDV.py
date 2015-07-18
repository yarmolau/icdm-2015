import csv
import numpy as np
import pandas as pd
from sklearn.cross_validation import KFold

if __name__ == "__main__":
	# setting the data path #
	data_path = "../../Data/"
	
	# name of the input and output files #
	dev_device_file = data_path + "dev_dev_basic.csv"
	val_device_file = data_path + "dev_val_basic.csv"
	cookie_file = data_path + "cookie_all_basic.csv"
	dev_DV_file = data_path + "dev_DV.csv"
	val_DV_file = data_path + "val_DV.csv"

	# reading the cookie file and getting a dict with drawbridge handle as keys and cookie id as values #
	print "Preparing Drawbridge Cookie Dict.."
	cookie_handle = open(cookie_file)
	cookie_reader = csv.reader(cookie_handle)
	cookie_reader.next() # skipping the header	
	drawbridge_cookie_dict = {}
	for row in cookie_reader:
		if row[0] != "-1":
			temp_list = drawbridge_cookie_dict.get(row[0],[])
			temp_list.append(row[1])
			drawbridge_cookie_dict[row[0]] = temp_list[:]
	cookie_handle.close()

	# getting the DV for the dev sample device IDs #
	print "Getting dev sample DV.."
	dev_device_handle = open(dev_device_file)
	dev_device_reader = csv.reader(dev_device_handle)
	dev_DV_handle = open(dev_DV_file, "w")
	dev_DV_writer = csv.writer(dev_DV_handle)

	dev_device_reader.next() # skipping the header
	dev_DV_writer.writerow(["device_id", "cookie_id_list"])

	for row in dev_device_reader:
		device_id = row[1]
		drawbridge_handle = row[0]
		cookie_list = drawbridge_cookie_dict[drawbridge_handle] 
		dev_DV_writer.writerow([device_id, cookie_list])
	dev_device_handle.close()
	dev_DV_handle.close()

        # getting the DV for the val sample device IDs #
        print "Getting val sample DV.."
        val_device_handle = open(val_device_file)
        val_device_reader = csv.reader(val_device_handle)
        val_DV_handle = open(val_DV_file, "w")
        val_DV_writer = csv.writer(val_DV_handle)

        val_device_reader.next() # skipping the header
        val_DV_writer.writerow(["device_id", "cookie_id_list"])

        for row in val_device_reader:
                device_id = row[1]
                drawbridge_handle = row[0]
                cookie_list = drawbridge_cookie_dict[drawbridge_handle]
                val_DV_writer.writerow([device_id, cookie_list])
        val_device_handle.close()
        val_DV_handle.close()
	
