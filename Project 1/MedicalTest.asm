#______________________________________________________________________________________________________________________________________________ 

#********************************************************Medical Test Management System********************************************************
#______________________________________________________________________________________________________________________________________________ 



#________________________________________________________________________________________________
#**************Prepared By**************
# Name: Qusay Taradeh, 	UID: 1212508
# Name: Rana Mosalam, 	UID: 1212565
#________________________________________________________________________________________________

##########
# * Note: data file of tests named data.txt must include in project file or write the path of data.txt file in your computer; path written in file_location in data section.
##########

.data

#________________________________________________________________________________________________
#**************Messages**************

wlc_msg: .asciiz "\n\n====================Welcome to Medical Test Managment System====================\n\n"		# welcome message
bye_msg: .asciiz "\n\n====================Good Bye:)====================\n\n"						# bye message

# messages of add new medical test 
id_msg: .asciiz "\nEnter patient ID number: "										# scan ID message
invalidID_msg: .asciiz "\nThe ID is not acceptable, enter another ID with 7 digits: "					# ID invalid message
tname_msg: .asciiz "\nEnter test name: "										# scan test name message
Hgb: .asciiz "Hgb"													# Hgb Test
BGT: .asciiz "BGT"													# BGT Test
LDL: .asciiz "LDL" 													# LDL Test
BPT: .asciiz "BPT" 													# BPT Test
invalid_name_msg: .asciiz "\nThe test name you enterd is wrong, enter again\n"						# Test name error message
year_msg: .asciiz "\n\nEnter the year of the test: "									# scan Test year
old_year_msg: .asciiz "\nThe yaer is less than 1900!\n" 								# year less than 2000 message
wrong_year_msg: .asciiz "\nThe year is greater than 2050!\n"								# year greater than 2024
month_msg: .asciiz "\nEnter the month of the test: "									# scan Test month
invalid_month_msg: .asciiz "\nThe month is invalid\n"									# Test month is erroe message
oneResult_msg: .asciiz "\nEnter the result of the test: "								# scan Test Result
firstResult_msg: .asciiz "\nEnter the first result of the test: "							# scan the first test result
secondResult_msg: .asciiz "\nEnter the second result of the test: "							# scan the second test result
addTest_msg: .asciiz "\nNew medical test added successfully\n"                                                         	# success add new test 

# messages of search
no_unnormal_msg: .asciiz "\nThere is no unnormal tests of given test.\n"
No_ID_msg: .asciiz "\nPatient ID does not exist\n"									# No Id found message
No_upnormal_msg: .asciiz "\nNo up normal results found\n"								# No up normal result found message
start_month_msg: .asciiz "\nEnter the start period month: "								# start period month message
start_year_msg: .asciiz "\nEnter the start period year: "								# start period year message
end_month_msg: .asciiz "\nEnter the end period month: "									# end period month message
end_year_msg: .asciiz "\nEnter the end period year: "									# end period year message
No_test_period_msg: .asciiz "\nThere is no tests found in this period\n"						# No tests in period found message

# messages of avg value for each test
avg_msg: .asciiz "\nThe average value of test result for each test:\n"							# avg value message
Hgb_msg: .asciiz "\nHemoglobin (Hgb) test: "										# avg Hgb test message
BGT_msg: .asciiz "Blood Glucose Test (BGT): "										# avg BGT test message
LDL_msg: .asciiz "LDL Cholesterol Low-Density Lipoprotein (LDL) test: "							# avg LDL test message
BPT_msg: .asciiz "Blood Pressure Test (BPT): "										# avg BPT test message
sbp_msg: .asciiz "Systolic Blood Pressure: "										# BPT result1 message
dbp_msg: .asciiz "Diastolic Blood Pressure: "										# BPT result2 message
# periods of each test result
g_per_dl_period: .asciiz "g/dL"												# grams per deciliter for Hgb test
mg_per_dl_period: .asciiz "mg/dL"											# milligrams per deciliter for BGT and LDL tests
mm_Hg_period: .asciiz "mm Hg"												# millimeters of mercury for Hgb test

# messages of update test results
updated_msg: .asciiz "\nNew result for given test updated!\n"								# updated message
no_updated_msg: .asciiz "\nNo match date enter the right date of test!\n"						# not updated message
not_exist_msg: .asciiz "\nNot exist test!\n"										# not exist test to update
existing_tests_msg: .asciiz "\nThese are tests for this patient with same entered type:\n"				# display the patient tests given test name

# messages of delete test
deleted_msg: .asciiz "\nTest for given patient ID deleted!\n"								# deleted message

# symbols
new_line: .asciiz "\n"
dash: .asciiz "-"
doubleq: .asciiz ": "
comma_space: .asciiz ", "
dot: .asciiz "."
#________________________________________________________________________________________________
#**************Menu**************

title: .asciiz "\n----------------Menu----------------"
menu: .asciiz "\nPlease select an option:\n(1) Add a new medical test\n(2) Search for a test by patient ID\n(3) Search for unnormal tests\n(4) Average test value\n(5) Update an existing test result\n(6) Delete a test\n(7) Exit program\n"	# main menu
search_menu: .asciiz "\nPlease select an option:\n(1) Retrieve all patient tests.\n(2) Retrieve all up normal patient tests.\n(3) Retrieve all patient tests in a given specific period.\n"
invalid_choice_msg: .asciiz "Invalid choice, please enter valid choice!\n"						# invalid choice message
#________________________________________________________________________________________________
#**************File Location and neccessary messages**************

file_location: .asciiz "data.txt"											# file location
error_file_msg: .asciiz "Fail to open the file\n"									# error open file message
load_data_msg: .asciiz "\n\nData loaded from the file successfully\n"							# success of load data
save_data_msg: .asciiz "\nData saved from the file successfully\n"							# success of save data		
#________________________________________________________________________________________________
#**************Constants and Memory Stored Values**************

ID_array: .word 0:200	# array of 100 lines at max to store ID (int 4B)in 1st col and address (4B) of other attributes in 2nd col
in_data: .space 1200   													# buffer for data loaded
out_data: .space 1200													# buffer for data stored	
buffer: .space 4													# buffer for test name input
exponent: .float 0.1													# Exponent for the post-decimal part in result section
Hgb_upper: .float 17.2													# Hgb upper normal result
Hgb_lower: .float 13.8													# Hgb lower normal result
BGT_upper: .float 99.0													# BGT upper normal result
BGT_lower: .float 70.0													# BGT lower normal result
LDL_upper: .float 100.0													# LDL upper normal result less than this value
BPT_sbp_upper: .float 120.0												# BPT Systolic Blood Pressure upper normal result less than this value
BPT_dbp_upper: .float 80.0												# BPT Diastolic Blood Pressure upper normal result less than this value

#________________________________________________________________________________________________
#**************Macros**************

.macro printi (%int)		# print integer macro
	move $a0, %int
	li $v0, 1
	syscall
.end_macro

.macro printf (%float)		# print float macro
	mov.s $f12, %float
	li $v0, 2
	syscall
.end_macro

.macro prints (%string)		# print string macro
	la $a0, %string
	li $v0, 4
	syscall
.end_macro

.macro printc (%char)		# print character macro
	move $a0, %char
	li $v0, 11
	syscall
.end_macro

.macro scani ()			# scan integer macro
	li $v0, 5
  	syscall
.end_macro

.macro scanf ()			# scan float macro
	li $v0, 6
  	syscall
.end_macro

.macro scans (%buffer, %count)	# scan string macro
	la $a0, %buffer		# address of input buffer
	li $a1, %count		# maximum number of characters to read
	li $v0, 8
  	syscall
.end_macro

.macro exit_program ()		# Exit program macro
	li $v0, 10
 	syscall
.end_macro

.text

#________________________________________________________________________________________________
#**************Main**************

main:
	# print welcome message
	prints(wlc_msg)
	
	# read file, load data and print message related to success
	jal read_file
	
	prints(load_data_msg)
	
	# create list, save loaded data to it and print message related to success	
	jal save_in_list
	prints(save_data_msg)

	# main loop => while(true){}
	main_loop:
		
		prints(title)				# display menu title
		prints(menu)				# display main menu
		scani()					# scan user choice as integer number
		move $t0, $v0				# save the choice to $t0
		
		# switch(case) statment => functions of the system
		beq $t0, 1, add_test			# Add a new medical test
		beq $t0, 2, search_test_by_id		# Search for a test by patient ID
		beq $t0, 3, search_unnormal_test	# Searching for unnormal tests
		beq $t0, 4, avg_test_val		# Average test value
		beq $t0, 5, update_test			# Update an existing test result 
		beq $t0, 6, delete_test			# Delete a test
		beq $t0, 7, exit			# Exit the program
		prints(invalid_choice_msg)		# else the user entered invalid choice
		j main_loop				# Redisplay the main menu
		
		# Case 1: Add a new medical test
		add_test:
			jal add_medicalTest
			
			j main_loop
			
		# Case 2: Search for a test by patient ID
		search_test_by_id:
			search_menu_loop:
				prints(search_menu)			# display search menu
				scani()					# scan user choice as integer number
				move $t0, $v0				# save the choice to $t0
				
				# switch(case) statment => functions of search
				beq $t0, 1, retrieve_tests		# Retrieve all patient tests 
				beq $t0, 2, retrieve_uptests		# Retrieve all up normal patient tests 
				beq $t0, 3, retrieve_tests_period	# Retrieve all patient tests in a given specific period
				prints(invalid_choice_msg)		# else the user entered invalid choice
				j search_menu_loop				# Redisplay the search menu
				
				# Case 1: Retrieve all patient tests 
				retrieve_tests:
					jal search_patient_tests
					j main_loop
				
				# Case 2: Retrieve all up normal patient tests 
				retrieve_uptests:
					jal search_upnormal_tests
					j main_loop
				
				# Case 3: Retrieve all patient tests in a given specific period
				retrieve_tests_period:
					jal search_period_tests
					j main_loop
			
		# Case 3: Searching for unnormal tests
		search_unnormal_test:
			jal unnormal_tests
			j main_loop
			
		# Case 4: Average test value
		avg_test_val:
			# Printing each test avg value
			prints(avg_msg)
			
			# Calculating the average
			jal calculate_avg
			
			# Hgb Test
			Hgb_avg:
				prints(Hgb_msg)
				printf($f3)
				prints(g_per_dl_period)
				prints(new_line)
			
			# BGT Test
			BGT_avg:
				prints(BGT_msg)
				printf($f5)
				prints(mg_per_dl_period)
				prints(new_line)
			
			# LDL Test
			LDL_avg:
				prints(LDL_msg)
				printf($f4)
				prints(mg_per_dl_period)
				prints(new_line)
				
			# BPT Test
			BPT_avg:
				prints(BPT_msg)
				prints(sbp_msg)
				printf($f6)
				prints(mm_Hg_period)
				prints(comma_space)
				prints(dbp_msg)
				printf($f7)
				prints(mm_Hg_period)
				prints(new_line)
			
			j main_loop
			
		# Case 5: Update an existing test result
		update_test:
			# Printing ID message
			prints(id_msg)
			scani()			# scan ID number
			move $t0, $v0		# save ID into $t0
			
			# Printing test name message
			prints(tname_msg)
			scans(buffer, 4)	# scan test name of 3 characters at most and save in buffer
		
			prints(existing_tests_msg)	# diplay existing tests
			# Searching for given ID and name test result
			jal update_result
			
			j main_loop
			
		# Case 6: Delete a test
		delete_test:
			# Printing ID message
			prints(id_msg)
			scani()			# scan ID number
			move $t6, $v0		# save ID into $t6
			
			# Printing test name message
			prints(tname_msg)
			scans(buffer, 4)	# scan test name of 3 characters at most and save in buffer
			
			# Deleting the test
			jal delete
			
			j main_loop
				
		# Case 7: Exit the program
		exit:
			# Print all tests after editing into the file
			jal save_to_file
			
			# Printing bye message
			prints(bye_msg)
			
			# Exit the program by syscall code written in macro
			exit_program()

#________________________________________________________________________________________________
#**************Case 1: Add a new medical test**************

add_medicalTest: 

# patient ID:
	prints(id_msg)
	scani()			# scan ID number
	move $t2, $v0		# save ID into $t2
	move $s5, $t2		# $s5 temp register contain the ID
	
	test_ID:
		bltz $s5, ID_invalid 	# if the enterd ID is less than zero branch to ID_invalid
		li $s6, 0              	# Initialize $s6 as a counter 
	
	count_digits_loop:
		beq $s5, $zero, check_count   	# Check if number becomes zero
   		div $s5, $s5, 10      		# Divide by 10
   		addi $s6, $s6, 1       		# Increment counter
   		j count_digits_loop  		# Repeat the loop
   	
   	ID_invalid:
		prints(invalidID_msg)	# message to tell the user to enter another patient ID
		scani()			# scan ID number
		move $t2, $v0		# save ID into $t2
		move $s5, $t2		# $s5 temp register contain the ID
		j test_ID
   	
   	check_count:
    		# Check if the count is exactly 7
    		bne $s6, 7, ID_invalid	# Branch if count is not 7
    	
 # test name
 	
 	# Printing test name message
	prints(tname_msg)
	scans(buffer, 4)	# scan test name of 3 characters at most and save in buffer
 	
 	Hgb_Test:
 		la $s5, Hgb	    	# Hgb Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareHgb_loop:
 		lb $t0, 0($s5) 			# load byte from Hgb
 		lb $t1, 0($s6)			# load byte from the buffer
 		bne $t0, $t1, BGT_Test		# if the two characters not equal jump to BGT_Test
 		beq $t0, $zero, endHgb_compare	# If we reach the end of Hgb end compare
       		beq $t1, $zero, endHgb_compare 	# If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		# Move to next character in Hgb
        	addi $s6, $s6, 1    		# Move to next character in buffer
        	j compareHgb_loop     		# Repeat the loop
        
        notHgb_equal:			 # the new test name not Hgb
        	j BGT_Test			 # check if the test name is BGT
        
        Hgb_equal:		        # the new test name is Hgb
        	li $s4,0 			# flag to indicate that the test has one result
        	j save_Name			# jumb to save the test name 
        
        endHgb_compare:
        	beq $t0, $t1, Hgb_equal  # If we reached the end of both strings, strings are equal
        	j notHgb_equal           # If we reached the end of one string before the other, strings are not equal
 	
 	BGT_Test:
 		la $s5, BGT	    	# BGT Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareBGT_loop:
 		lb $t0, 0($s5) 		# load byte from BGT
 		lb $t1, 0($s6)		# load byte from the buffer
 		bne $t0, $t1, LDL_Test		 # if the two characters not equal jump to LDL_Teat
 		beq $t0, $zero, endBGT_compare   	 # If we reach the end of BGT end compare
        	beq $t1, $zero, endBGT_compare  	 # If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		 # Move to next character in BGT
        	addi $s6, $s6, 1    		 # Move to next character in buffer
        	j compareBGT_loop     		 # Repeat the loop
        
        notBGT_equal:			# the new test name not BGT
        	j LDL_Test			# check if the test name is LDL
        
        BGT_equal:			# the new test name is BGT
        	li $s4,0 			# flag to indicate that the test has one result
        	j save_Name			# jumb to save the test name 
        
        endBGT_compare:
        	beq $t0, $t1, BGT_equal  # If we reached the end of both strings, strings are equal
        	j notBGT_equal          # If we reached the end of one string before the other, strings are not equal
       
        LDL_Test:
        	la $s5, LDL	    	# LDL Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareLDL_loop:
 		lb $t0, 0($s5) 		# load byte from LDL
 		lb $t1, 0($s6)		# load byte from the buffer
 		bne $t0, $t1, BPT_Test		 # if the two characters not equal jump to BPT_Test
 		beq $t0, $zero, endLDL_compare   	 # If we reach the end of LDL end compare
        	beq $t1, $zero, endLDL_compare  	 # If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		 # Move to next character in LDL
        	addi $s6, $s6, 1    		 # Move to next character in buffer
        	j compareLDL_loop     		 # Repeat the loop
        
        notLDL_equal:			# the new test name not LDL
        	j BPT_Test			# check if the test name is BPT
        
        LDL_equal:			# the new test name is LDL
        	li $s4,0 			# flag to indicate that the test has one result
        	j save_Name			# jumb to save the test name 
        
        endLDL_compare:
        	beq $t0, $t1, LDL_equal  # If we reached the end of both strings, strings are equal
        	j notLDL_equal          # If we reached the end of one string before the other, strings are not equal
 	
 	BPT_Test:
 		la $s5, BPT	    	# BPT Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareBPT_loop:
 		lb $t0, 0($s5) 		# load byte from BPT
 		lb $t1, 0($s6)		# load byte from the buffer
 		bne $t0, $t1, Name_Error	 # if the two characters not equal then the test name is wrong
 		beq $t0, $zero, endBPT_compare   	 # If we reach the end of BPT end compare
        	beq $t1, $zero, endBPT_compare  	 # If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		 # Move to next character in BPT
        	addi $s6, $s6, 1    		 # Move to next character in buffer
        	j compareBPT_loop     		 # Repeat the loop
        
        notBPT_equal:			# the new test name not BPT
        	j Name_Error			# the entered name is wrong
        
        BPT_equal:			# the new test name is BPT
        	li $s4,1			# flag to indicate that the test is PBT and it has two results
        	j save_Name			# jumb to save the test name 
        
        endBPT_compare:
        	beq $t0, $t1, BPT_equal  # If we reached the end of both strings, strings are equal
        	j notBPT_equal          # If we reached the end of one string before the other, strings are not equal
 	
 	Name_Error: 		 # the entered name is wrong
 		prints(invalid_name_msg)	# error message and enter another name
		scans(buffer, 4)		# scan test name of 3 characters at most and save in buffer
 	
 	j Hgb_Test 		# return to check the test name
 	
 	save_Name:
 		la $s6, buffer		# Test Name buffer
 		lb $t3, 0($s6)		# load the firs character in t3
 		lb $t4, 1($s6)		# load the second character in t4
 		lb $t5, 2($s6)		# load the third character in t5
 	
  # Test Year 
  	year:
  		prints(year_msg) 		# message to enter test year
  		scani()				# scan year
  		move $t6, $v0			# move year to $t6
  		blt $t6, 1900, old_year		# if year < 1900 error
  		bgt $t6, 2050, wrong_year	# if year > 2050 error
  		j month
  	
  	old_year:			# year less then 2000
  		prints(old_year_msg) 		# old year message
  		j year
  	
  	wrong_year:			# year greater than 2024
  		prints(wrong_year_msg)		# wrong year message
  		j year
  	
   # Test month 	
  	month:
  		prints(month_msg)		# message to enter month
  		scani()				# scan year
  		move $t7, $v0			# save test month in $t7
  		bgt $t7, 12, month_error	# month greater than 12
  		blt $t7, 1, month_error 	# month less than 1
  		j result
  	
  	month_error:
  		prints(invalid_month_msg)
  		j month
  	
  # Test results 
  	result:
  		beq $s4, 1, two_Results		# s4 is flag, if flag =1 then the test is BPT and have two results
  		beqz $s4, one_Result
  	
  	one_Result:
  		prints(oneResult_msg)
  		scanf()			# scan new result and save into $f0
  		j End
  	
  	two_Results:
  		prints(firstResult_msg)
  		scanf()			# scan new result and save into $f0
  		mov.s $f3,$f0
  		prints(secondResult_msg)
  		scanf()			# scan new result and save into $f0
  		mov.s $f1,$f0
  		mov.s $f0,$f3
  		j End
  	
#=======================================================================================
# $t2 = test id
# $t3 = 1st char of test name
# $t4 = 2nd char of test name
# $t5 = 3rd char of test name
# $t6 = test year
# $t7 = test month
# $f0 = 1st result of test
# $f1 = 2nd result of test
#=======================================================================================	
  	
 	End:
 		sw $ra, 0($sp)  	# Save $ra on the stack
		addiu $sp, $sp, -4  	# Adjust the stack pointer
		jal add_node		# adding new node and store the data in registers into it
			
		# Restore the return address
		addiu $sp, $sp, 4  	# Adjust the stack pointer
		lw $ra, 0($sp)  	# Restore $ra from the stack
		prints (addTest_msg)       # message of success add new midical test
		jr $ra

#________________________________________________________________________________________________
#************** Case 2: Search for a test by patient ID *************

# Case 2.1: Retrieve all patient tests 
search_patient_tests:
	
	prints(id_msg)
	scani()			# scan ID number
  	move $s5, $v0 		# store the entered ID
  	move $t0, $v0 		# store the entered ID	
  	
  	test_userID:
		bltz $s5, Invalid_ID  	# if the enterd ID is less than zero branch to ID_Error
		li $s6, 0             	# Initialize $s6 as a counter 
	
	countID_Digits:
		beq $s5, $zero, checkCounts  	# Check if number becomes zero
   		div $s5, $s5, 10       		# Divide by 10
   		addi $s6, $s6, 1       		# Increment counter
   		j countID_Digits		# Repeat the loop
   	
   	Invalid_ID:
		prints(invalidID_msg)	# message to tell the user to enter another patient ID
		scani()
		move $t0, $v0 		# store the entered ID	
		move $s5, $v0		# $s5 temp register contain the ID
		j test_userID
   	
   	checkCounts:
    		# Check if the count is exactly 7
    		bne $s6, 7, Invalid_ID  	 # Branch if count is not 7
    	
	la $s3, ID_array	# load the base address of the array
	move $s4, $zero		# counter for rows => i=0
	
	search_loop:
		add $s2, $s3, $s4	# &ID_array + i
		lw $s0, 0($s2)		# load patient ID
		
		beqz $s0, end_search	# if ID_array[i]==0 end search
		
		beq $s0, $t0, find_ID	# if the entered ID equal the ID in the array[i] branch to find_ID
		
		j increment_index	# if Id enterd by zero != ID_array[i] -> increment i
		
		find_ID:
			li $s5,1		# flag to indicate there is a match of patient IDs
			lw $s1, 4($s2)		# load the address of heap that contain tests' results
			# load name characters
    			lb $t3, 16($s1)		# load 1st character of name
   			lb $t4, 17($s1)		# load 2nd character of name
   			lb $t5, 18($s1)		# load 3rd character of name

			# load date
			lw $t6, 0($s1)		# load year
 	  		lw $t7, 4($s1)		# load month
		
			# load results
			lwc1 $f1, 8($s1)	# load 1st result => $f0 = heap[8]
			lwc1 $f2, 12($s1)	# load 2nd result => $f1 = heap[12]
   		
   			##################Printing...##########################
   			prints(new_line)
   			printi($s0)		# print patient ID
   			prints(doubleq)		# print ":"
   			printc($t3)		# print 1st character of name
   			printc($t4)		# print 2nd character of name
   			printc($t5)		# print 3rd character of name
   			prints(comma_space)	# print ", "
   			printi($t6)		# print year
   			prints(dash)		# print "-"
   			printi($t7)		# print month
   			prints(comma_space)	# print ", "
   			printf($f1)		# print 1st result
   			bne $t4, 'P', one_result	# ignore 2nd result if test type not BPT
   			prints(comma_space)	# print ", "
   			printf($f2)		# print 2nd result
   			one_result:		# if test type not BPT
   			prints(new_line)	# print new line "\n"
   			########################################################
   		increment_index: 
   			addiu $s4, $s4, 8	# point to next line (counter++)
   			j search_loop		# back to search
   		
   		end_search:
   			beq $s5, 1, done_search		# $s5 is a flag if the flag =1 the ID is found else if no ID found
   			prints(No_ID_msg)			# message to tell the user the patient ID not exist
   			
   	done_search:
   		jr $ra   	
#________________________________________________________________________________________________

# Case 2.2: Retrieve all up normal patient tests
search_upnormal_tests:
	
	prints(id_msg)
	scani()			# scan ID number
  	move $s5, $v0 		# store the entered ID
  	move $t0, $v0 		# store the entered ID
  	
  	testUserID:
		bltz $s5, ID_Invalid 	# if the enterd ID is less than zero branch to ID_Error
		li $s6, 0              # Initialize $s6 as a counter 
	
	count_digits:
		beq $s5, $zero, check_IDcount   # Check if number becomes zero
   		div $s5, $s5, 10       		# Divide by 10
   		addi $s6, $s6, 1       		# Increment counter
   		j count_digits		 	# Repeat the loop
   	
   	ID_Invalid:
		prints(invalidID_msg)	# message to tell the user to enter another patient ID
		scani()
		move $t0, $v0 		# store the entered ID	
		move $s5, $v0		# $s5 temp register contain the ID
		j testUserID
   	
   	check_IDcount:
    		# Check if the count is exactly 7
    		bne $s6, 7, ID_Invalid   	 # Branch if count is not 7
    	
	la $s3, ID_array		# load the base address of the array
	move $s4, $zero			# counter for rows => i=0
	li $s6, 0			# initialize flag, if the flag=0 no up normal results found
	li $s5, 0			# initialize flag, if the flag=0 the id does not exist
	
	search_upnormal_loop:
		add $s2, $s3, $s4	# &ID_array + i
		lw $s0, 0($s2)		# load patient ID
		
		beq $s0, $t0, find_patientID	# if the entered ID equal the ID in the array[i] branch to find_patientID
		
		beqz $s0, end_search_upnormal	# if ID_array[i]==0 end search
		
		bne $s0, $t0, increment_i 	# if Id enterd by zero != ID_array[i] -> increment i
		
		find_patientID:
			lw $s1, 4($s2)		# load the address of heap that contain tests' results
			li $s5, 1		# set flag to 1 which means the id is exist
			
			# load name characters
    			lb $t3, 16($s1)		# load 1st character of name
   			lb $t4, 17($s1)		# load 2nd character of name
   			lb $t5, 18($s1)		# load 3rd character of name
   		
   			beq $t3, 'L', itsLDL_Test 	
   			beq $t3, 'H', itsHgb_Test
   			beq $t4, 'P', itsBPT_Test
   			beq $t4, 'G', itsBGT_Test
   			j increment_i
   		
   		itsLDL_Test:
   			# load result
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s $f3, LDL_upper		# load 100.0 in $f3
			c.lt.s $f1,$f3			# cc = ($f1 < 100)
			bc1f upnormal_result		# branch to upnormal_result if (cc==0)		
			j increment_i			# if the result not up normal range incement index
			
		itsHgb_Test:
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s  $f3, Hgb_lower		# load 13.8 in $f3
			c.lt.s $f1, $f3			# cc = ($f1<13.8)
			bc1t upnormal_result		# branch to unnormal_result if (cc==1)
			l.s $f3, Hgb_upper		# load 17.2 in $f3
			c.le.s $f1, $f3			# cc = ($f1<17.2)
			bc1f upnormal_result		# branch to upnormal_result if (cc==0)	
			j increment_i			# if the result not up normal range incement index
		
		itsBGT_Test:
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s  $f3, BGT_lower		# load 13.8 in $f3
			c.lt.s $f1, $f3			# cc = ($f1<70)
			bc1t upnormal_result		# branch to upnormal_result if (cc==1)
			l.s $f3, BGT_upper		# load 17.2 in $f3
			c.le.s $f1, $f3			# cc = ($f1<99)
			bc1f upnormal_result		# branch to upnormal_result if (cc==0)	
			j increment_i			# if the result not up normal range incement index
		
		itsBPT_Test:
			# Check 1st Result
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s $f3, BPT_sbp_upper		# load 120 in $f3
			c.lt.s $f1,$f3			# cc = ($f1<120)
			bc1f upnormal_result		# branch to upnormal_result if (cc==0)		 		 
			
			# Check 2nd Result			
			lwc1 $f2, 12($s1)		# load 2nd result => $f1 = heap[12]
			l.s $f3, BPT_dbp_upper		# load 80 in $f3
			c.lt.s $f2,$f3			# cc = ($f2<80)
			bc1f upnormal_result		# branch to upnormal_result if (cc==0)		
			j increment_i				# if the result not up normal range incement index

   		upnormal_result:
			# load date
			li $s6,1 		# flag to indicate there is upnormal result
			lw $t6, 0($s1)		# load year
 	  		lw $t7, 4($s1)		# load month
	
   			################## Printing...##########################
   			prints(new_line)
   			printi($s0)		# print patient ID
   			prints(doubleq)		# print ":"
   			printc($t3)		# print 1st character of name
   			printc($t4)		# print 2nd character of name
   			printc($t5)		# print 3rd character of name
   			prints(comma_space)	# print ", "
   			printi($t6)		# print year
   			prints(dash)		# print "-"
   			printi($t7)		# print month
   			prints(comma_space)	# print ", "
   			printf($f1)		# print 1st result
   			bne $t4, 'P', one_upnormalresult	# ignore 2nd result if test type not BPT
   			prints(comma_space)	# print ", "
   			printf($f2)		# print 2nd result
   			one_upnormalresult:		# if test type not BPT
   			prints(new_line)	# print new line "\n"
   			########################################################
   		increment_i: 
   			addiu $s4, $s4, 8		# point to next line (counter++)
   			j search_upnormal_loop		# back to search
   		
   		Noupnormal_Result:		# no up normal result found
   			prints(No_upnormal_msg)		# print message to tell the user no up normal result found
   			j done_upnormal_search		# end search
   		
   		ID_notExist:			# the ID does not exist 
   			prints(No_ID_msg)			# message to tell the user the patient ID not exist
   			j done_upnormal_search		# end search
   		
   		end_search_upnormal:
   			beq $s5, 0, ID_notExist		# $s5 is a flag if the flag =1 the ID is found else no ID found
   			beq $s6, 0, Noupnormal_Result	# $s6 is a flag if the flag =1 up normal result found else no up normal result found 
   		
   	done_upnormal_search:
   		jr $ra
#________________________________________________________________________________________________

# Case 2.3: Retrieve all patient tests in a given specific period
search_period_tests:
	
	# Read ID
	prints(id_msg)
	scani()			# scan ID number
  	move $s5, $v0 		# store the entered ID
  	move $t0, $v0 		# store the entered ID
  	
  	testUserID_period:
		bltz $s5, ID_Invalid_period 	# if the enterd ID is less than zero branch to ID_Error
		li $s6, 0              		# Initialize $s6 as a counter 
	
	count_digits_period:
		beq $s5, $zero, check_IDcount_period   	# Check if number becomes zero
   		div $s5, $s5, 10       			# Divide by 10
   		addi $s6, $s6, 1       			# Increment counter
   		j count_digits_period			# Repeat the loop
   	
   	ID_Invalid_period:
		prints(invalidID_msg)	# message to tell the user to enter another patient ID
		scani()
		move $t0, $v0 		# store the entered ID	
		move $s5, $v0		# $s5 temp register contain the ID
		j testUserID_period
   	
   	check_IDcount_period:
    		# Check if the count is exactly 7
    		bne $s6, 7, ID_Invalid_period   	 # Branch if count is not 7
    	
    	# Read Start month and year of the period
  	prints(start_year_msg)	
  	scani()			
  	move $t1, $v0		# store input start year
  	prints(start_month_msg)
  	scani()
  	move $t2, $v0		# store input start month 
	
	# Read End month and year of the period
  	prints(end_year_msg)
  	scani()
  	move $t8, $v0		# store input end year
  	prints(end_month_msg)
  	scani()
  	move $t9, $v0		# store input end month	
    	
	la $s3, ID_array		# load the base address of the array
	move $s4, $zero			# counter for rows => i=0
	li $s5, 0			# initialize flag, if the flag=0 the id does not exist
	li $s6, 0			# initialize flag, if the flag=0 no tests found in this period
		
	search_period_loop:
		add $s2, $s3, $s4	# &ID_array + i
		lw $s0, 0($s2)		# load patient ID
		
		beq $s0, $t0, find_patientID_period	# if the entered ID equal the ID in the array[i] branch to find_patientID
		
		beqz $s0, end_search_period		# if ID_array[i]==0 end search
		
		bne $s0, $t0, incr_i 			# if Id enterd by zero != ID_array[i] -> increment i
		
		find_patientID_period:
  			
  			# Load values to check
			lw $s1, 4($s2)		# load the address of heap that contain tests' results
			li $s5, 1		# set flag to 1 which means the id is exist
			
			# Load Date of test
			lw $t6, 0($s1)		# load year
 	  		lw $t7, 4($s1)		# load month
			
			# Checking
			beq $t1, $t8, check_month	# if start and end year equals check the months
 	  		bge $t6, $t1, check_end_year	# if patient test year greater than start year jump to check the end year
 	  		blt $t6, $t1, incr_i		# if patient test year less than start year jump to increment_the_index
 	  		bgt $t6, $t8, incr_i		# if patient test year grater than end year jump to increment_the_index
 	  		ble $t6, $t8, check_month	# if patient test year less than or equal end year jump to check month
 	  		j incr_i
 	  		
   			check_month:
 	  			bge $t7, $t2, check_end_month	# if patient test month greater than start month jump to check the end year
	 	  		blt $t7, $t2, incr_i		# if patient month less than start month jump to increment_the_index
	 	  		bgt $t7, $t9, incr_i		# if patient month grater than end month jump to increment_the_index
				j incr_i
				
	 	  	check_end_year:
		 	  	ble $t6, $t8, check_months
 			  	j incr_i
 			  	
 			 check_months:
 			 	bgt $t7, $t9, incr_i		# if patient month grater than end month jump to increment_the_index
 			 	j in_period_tests
 	  	
 		  	check_end_month:
 			  	ble $t7, $t9, in_period_tests
 	  			j incr_i
   			j incr_i
   			
   		in_period_tests:
   			li $s6, 1 		# flag to indicate there is test in period
   			
   			# load name characters
    			lb $t3, 16($s1)		# load 1st character of name
   			lb $t4, 17($s1)		# load 2nd character of name
   			lb $t5, 18($s1)		# load 3rd character of name
	
			# load date
			lw $t6, 0($s1)		# load year
	 	  	lw $t7, 4($s1)		# load month
			
			# load results
			lwc1 $f1, 8($s1)	# load 1st result => $f0 = heap[8]
			lwc1 $f2, 12($s1)	# load 2nd result => $f1 = heap[12]
	   		
	   		##################Printing...##########################
   			prints(new_line)
   			printi($s0)			# print patient ID
   			prints(doubleq)			# print ":"
   			printc($t3)			# print 1st character of name
   			printc($t4)			# print 2nd character of name
   			printc($t5)			# print 3rd character of name
   			prints(comma_space)		# print ", "
   			printi($t6)			# print year
   			prints(dash)			# print "-"
   			printi($t7)			# print month
   			prints(comma_space)		# print ", "
   			printf($f1)			# print 1st result
   			bne $t4, 'P', its_one_res	# ignore 2nd result if test type not BPT
   			prints(comma_space)		# print ", "
   			printf($f2)			# print 2nd result
   			its_one_res:			# if test type not BPT
   				prints(new_line)	# print new line "\n"
   			########################################################
   		
   		incr_i: 
   			addiu $s4, $s4, 8		# point to next line (counter++)
   			j search_period_loop		# back to search
   		
   		NoTests_period:				# no up normal result found
   			prints(No_test_period_msg)	# print message to tell the user no tests found
   			j done_period_search		# end search
   		
   		ID_notExist_period:			# the ID does not exist 
   			prints(No_ID_msg)		# message to tell the user the patient ID not exist
   			j done_period_search		# end search
   		
   		end_search_period:
   			beq $s5, 0, ID_notExist_period		# $s5 is a flag if the flag =1 the ID is found else no ID found
   			beq $s6, 0, NoTests_period		# $s6 is a flag if the flag =1 tests found else no tests found 
   		
   	done_period_search:
		jr $ra

#________________________________________________________________________________________________
#************** Case 3: Searching for unnormal tests **************
  
unnormal_tests:
  
	prints(tname_msg)
	scans(buffer, 4)		# scan test name of 3 characters at most and save in buffer
 	
 	HgbTest:
 		la $s5, Hgb	    	# Hgb Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareHgb:
 		lb $t0, 0($s5) 			# load byte from Hgb
 		lb $t1, 0($s6)			# load byte from the buffer
 		bne $t0, $t1, BGTTest		# if the two characters not equal jump to BGT_Test
 		beq $t0, $zero, endHgbCompare   # If we reach the end of Hgb end compare
        	beq $t1, $zero, endHgbCompare 	# If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		# Move to next character in Hgb
        	addi $s6, $s6, 1    		# Move to next character in buffer
        	j compareHgb     		# Repeat the loop
        
        notHgb:			 # the new test name not Hgb
        	j BGTTest			 # check if the test name is BGT
        
        Hgbequal:		        # the new test name is Hgb
        	li $s4,0 		# flag to indicate that the test has one result
        	j Name			# jumb to save the test name 
        
        endHgbCompare:
        	beq $t0, $t1, Hgbequal  # If we reached the end of both strings, strings are equal
        	j notHgb	        # If we reached the end of one string before the other, strings are not equal
 	
 	
 	BGTTest:
 		la $s5, BGT	    	# BGT Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareBGT:
 		lb $t0, 0($s5) 			# load byte from BGT
 		lb $t1, 0($s6)			# load byte from the buffer
 		bne $t0, $t1, LDLTest		# if the two characters not equal jump to LDL_Teat
 		beq $t0, $zero, endBGTCompare   # If we reach the end of BGT end compare
        	beq $t1, $zero, endBGTCompare  	# If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		# Move to next character in BGT
        	addi $s6, $s6, 1    		# Move to next character in buffer
        	j compareBGT    		# Repeat the loop
        
        notBGT:					# the new test name not BGT
		j LDLTest			# check if the test name is LDL
        
        BGTequal:				# the new test name is BGT
		li $s4,0 			# flag to indicate that the test has one result
        	j Name				# jumb to save the test name 
        
        endBGTCompare:
       		beq $t0, $t1, BGTequal		# If we reached the end of both strings, strings are equal
        	j notBGT	         	# If we reached the end of one string before the other, strings are not equal
        
        
        LDLTest:
        	la $s5, LDL	    	# LDL Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareLDL:
 		lb $t0, 0($s5) 			# load byte from LDL
 		lb $t1, 0($s6)			# load byte from the buffer
 		bne $t0, $t1, BPTTest		# if the two characters not equal jump to BPT_Test
 		beq $t0, $zero, endLDLCompare   # If we reach the end of LDL end compare
        	beq $t1, $zero, endLDLCompare  	# If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		# Move to next character in LDL
        	addi $s6, $s6, 1    		# Move to next character in buffer
        	j compareLDL    		# Repeat the loop
        
        notLDL:					# the new test name not LDL
		j BPTTest			# check if the test name is BPT
        
        LDLequal:				# the new test name is LDL
		li $s4,0 			# flag to indicate that the test has one result
        	j Name				# jumb to save the test name 
        
        endLDLCompare:
	        beq $t0, $t1, LDLequal  	# If we reached the end of both strings, strings are equal
        	j notLDL          		# If we reached the end of one string before the other, strings are not equal
 	
 	
 	BPTTest:
 		la $s5, BPT	    	# BPT Test
 		la $s6, buffer		# Test Name buffer
 	
 	compareBPT:
 		lb $t0, 0($s5) 			# load byte from BPT
 		lb $t1, 0($s6)			# load byte from the buffer
 		bne $t0, $t1, NameError		# if the two characters not equal then the test name is wrong
 		beq $t0, $zero, endBPTCompare   # If we reach the end of BPT end compare
        	beq $t1, $zero, endBPTCompare  	# If we reach the end of buffer end compare 
        	addi $s5, $s5, 1   		# Move to next character in BPT
        	addi $s6, $s6, 1    		# Move to next character in buffer
        	j compareBPT    		# Repeat the loop
        
        notBPT:					# the new test name not BPT
        	j NameError			# the entered name is wrong
        
        BPTequal:				# the new test name is BPT
		li $s4,1			# flag to indicate that the test is PBT and it has two results
        	j Name				# jumb to save the test name 
        
        endBPTCompare:
        	beq $t0, $t1, BPTequal  	# If we reached the end of both strings, strings are equal
        	j notBPT        		# If we reached the end of one string before the other, strings are not equal
 	
 	NameError: 		 		# the entered name is wrong
 		prints(invalid_name_msg)	# error message and enter another name
		scans(buffer, 4)		# scan test name of 3 characters at most and save in buffer
 		j HgbTest 			# return to check the test name
 	
 	Name:
 		la $s6, buffer		# Test Name buffer
 		lb $t3, 0($s6)		# load the firs character in t3
 		lb $t4, 1($s6)		# load the second character in t4
 		lb $t5, 2($s6)		# load the third character in t5
 	
 	la $s3, ID_array		# load the base address of the array
	move $s4, $zero			# counter for rows => i=0

	searchUnnormalResult_loop:
		add $s2, $s3, $s4		# &ID_array + i
		
		lw $s0, 0($s2)			# load patient ID
		beqz $s0, end_searchResult	# if ID_array[i]==0 end search
		
		lw $s1, 4($s2)		# load the address of heap that contain tests' results
		
		# load name characters
    		lb $s5, 16($s1)		# load 1st character of name
   		lb $s6, 17($s1)		# load 2nd character of name
   		
   		# Checking the equality of characters for searched test such that characters are in $t3, 4 and $t5
   		beq $t3, $s5, test_secondcharacter
   		j incrementi
   		
   		test_secondcharacter:
   			beq $t4, $s6, testFound
   			j incrementi		# else: next line
   		
   		testFound:
   			beq $t3, 'L', its_LDL_test 	
   			beq $t3, 'H', its_Hgb_test
   			beq $t4, 'P', its_BPT_test
   			beq $t4, 'G', its_BGT_test
   			j incrementi
   			
   		its_LDL_test:
   			# load result
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s $f3, LDL_upper		# load 100.0 in $f3
			c.lt.s $f1,$f3			# cc = ($f1 < 100)
			bc1f unnormalResult		# branch to unnormal_result if (cc==0)	
			j incrementi			# if the result in normal range incement index
			
		its_Hgb_test:
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s  $f3, Hgb_lower		# load 13.8 in $f3
			c.lt.s $f1, $f3			# cc = ($f1<13.8)
			bc1t unnormalResult		# branch to unnormal_result if (cc==1)
			l.s $f3, Hgb_upper		# load 17.2 in $f3
			c.le.s $f1, $f3			# cc = ($f1<17.2)
			bc1f unnormalResult		# branch to unnormal_result if (cc==0)
			j incrementi			# if the result in normal range incement index
		
		its_BGT_test:
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s  $f3, BGT_lower		# load 13.8 in $f3
			c.lt.s $f1, $f3			# cc = ($f1<70)
			bc1t unnormalResult		# branch to unnormal_result if (cc==1)
			l.s $f3, BGT_upper		# load 17.2 in $f3
			c.le.s $f1, $f3			# cc = ($f1<99)
			bc1f unnormalResult		# branch to unnormal_result if (cc==0)
			j incrementi			# if the result in normal range incement index
		
		its_BPT_test:
			# Check 1st Result
			lwc1 $f1, 8($s1)		# load 1st result => $f1 = heap[8]
			l.s $f3, BPT_sbp_upper		# load 120 in $f3
			c.lt.s $f1,$f3			# cc = ($f1<120)
			bc1f unnormalResult		# branch to unnormal_result if (cc==0)		 		 
			
			# Check 2nd Result			
			lwc1 $f2, 12($s1)		# load 2nd result => $f1 = heap[12]
			l.s $f3, BPT_dbp_upper		# load 80 in $f3
			c.lt.s $f2,$f3			# cc = ($f2<80)
			bc1f unnormalResult		# branch to unnormal_result if (cc==0)	
			j incrementi			# if the result in normal range incement index
		
   		
   		unnormalResult:
			# load date
			li $t0,1 		# flag to indicate there is upnormal result
			lw $t6, 0($s1)		# load year
 	  		lw $t7, 4($s1)		# load month
	
   			################## Printing...##########################
   			prints(new_line)	# print new line "\n"
   			printi($s0)		# print patient ID
   			prints(doubleq)		# print ":"
   			printc($t3)		# print 1st character of name
   			printc($t4)		# print 2nd character of name
   			printc($t5)		# print 3rd character of name
   			prints(comma_space)	# print ", "
   			printi($t6)		# print year
   			prints(dash)		# print "-"
   			printi($t7)		# print month
   			prints(comma_space)	# print ", "
   			printf($f1)		# print 1st result
   			bne $t4, 'P', oneUnnormalResult		# ignore 2nd result if test type not BPT
   			prints(comma_space)	# print ", "
   			printf($f2)		# print 2nd result
   			oneUnnormalResult:		# if test type not BPT
   				prints(new_line)	# print new line "\n"
   			########################################################
   		incrementi: 
   			addiu $s4, $s4, 8			# point to next line (counter++)
   			j searchUnnormalResult_loop		# back to search
 
   	end_searchResult:
   		beq $t0, 0, NoUnnormalResult	# $t0 is a flag if the flag =1 unnormal result found else no unnormal result found 
   		j doneUnnormalResult_search	# end search
   			
   	NoUnnormalResult:			# no up normal result found
   		prints(no_unnormal_msg)		# print message to tell the user no up normal result found
   
	doneUnnormalResult_search:
   		jr $ra

#________________________________________________________________________________________________
#************** Case 4: Average test value **************

calculate_avg:
	la $t1, ID_array	# load the base address of the array
	move $t0, $zero		# counter for rows => i=0
			
	# initialise the registers for each test type to compute the average results
	mtc1 $zero, $f0		# zero float for computing avg
	move $t5, $zero		# counter for Hgb test
	mtc1 $zero, $f3		# average for Hgb test
			
	move $t6, $zero		# counter for LDL test
	mtc1 $zero, $f4		# average for LDL test
			
	move $t7, $zero		# counter for BGT test
	mtc1 $zero, $f5		# average for BGT test
			
	move $t8, $zero		# counter for BPT test
	mtc1 $zero, $f6		# average 1 for BPT test
	mtc1 $zero, $f7		# average 2 for BPT test
			
	loop_avg:
		add $t2, $t1, $t0	# &ID_array + i
		
		lw $s0, 4($t2)		# load the address of heap that contain tests' results
		beqz $s0, eod		# branch to end of data when there is no test
			
		# load results
		lwc1 $f1, 8($s0)	# load 1st result => $f0 = heap[8]
		lwc1 $f2, 12($s0)	# load 2nd result => $f1 = heap[12]
			
		# load name characters
    		lb $t3, 16($s0)		# load 1st character of name
   		lb $t4, 17($s0)		# load 2nd character of name
			
   		# Hgb Test
   		beq $t3, 'H', Hgb_test
   			
   		# LDL Test
   		beq $t3, 'L', LDL_test
   			
		# BGT Test
   		beq $t4, 'G', BGT_test
   			
		# BPT Test
   		beq $t4, 'P', BPT_test
   			
   		# unknown Test
   		j next_line		# Branch to next line
			
		Hgb_test:
			add.s $f3, $f3, $f1	# sum = sum + new result
			addiu $t5, $t5, 1	# counter++
			j next_line		# Branch to next line
				
		LDL_test:
			add.s $f4, $f4, $f1	# sum = sum + new result
			addiu $t6, $t6, 1	# counter++
			j next_line		# Branch to next line
				
		BGT_test:
			add.s $f5, $f5, $f1	# sum = sum + new result
			addiu $t7, $t7, 1	# counter++
			j next_line		# Branch to next line
			
		BPT_test:
			add.s $f6, $f6, $f1	# sum1 = sum1 + new result1
			add.s $f7, $f7, $f2	# sum2 = sum2 + new result2
			addiu $t8, $t8, 1	# counter++
			
		next_line:
			addiu $t0, $t0, 8	# point to next line (counter++)
			j loop_avg
			
		eod:				# End of data(EOF)
			# Hgb Test
			beqz $t5, Hgb_skip	# check division by zero (if count equal zero then set avg to default 0)
			mtc1 $t5, $f0		# move the count of results to $f0 ($f0 = count)
			cvt.s.w $f0, $f0	# convert integer value to float
			div.s $f3, $f3, $f0	# avg = sum / count
			mtc1 $zero, $f0		# reset temp register $f8 for next computing
			Hgb_skip:		# result = 0
			
			# BGT Test
			beqz $t7, BGT_skip	# check division by zero (if count equal zero then set avg to default 0)
			mtc1 $t7, $f0		# move the count of results to $f0 ($f0 = count)
			cvt.s.w $f0, $f0	# convert integer value to float
			div.s $f5, $f5, $f0	# avg = sum / count
			mtc1 $zero, $f0		# reset temp register $f0 for next computing
			BGT_skip:		# result = 0
								
			# LDL Test
			beqz $t6, LDL_skip	# check division by zero (if count equal zero then set avg to default 0)
			mtc1 $t6, $f0		# move the count of results to $f0 ($f0 = count)
			cvt.s.w $f0, $f0	# convert integer value to float
			div.s $f4, $f4, $f0	# avg = sum / count
			mtc1 $zero, $f0		# reset temp register $f0 for next computing
			LDL_skip:		# result = 0
			
			# BPT Test
			beqz $t8, BPT_skip	# check division by zero (if count equal zero then set avg to default 0)
			mtc1 $t8, $f0		# move the count of results to $f0 ($f0 = count)
			cvt.s.w $f0, $f0	# convert integer value to float
			div.s $f6, $f6, $f0	# avg1 = sum / count
			div.s $f7, $f7, $f0	# avg2 = sum / count
			mtc1 $zero, $f0		# reset temp register $f0 for next computing
			BPT_skip:		# result = 0
			
	jr $ra		# return to the main

#________________________________________________________________________________________________
#************** Case 5: Update an existing test result **************

update_result:
	# Now $t0 = patient ID, and buffer =  test name
	la $t3, ID_array	# load the base address of the array
	move $t2, $zero		# counter for rows => i=0
	move $s5, $zero		# set exist flag initially to zero
					
	loop_search:
		add $t4, $t3, $t2	# &ID_array + i
		
		lw $s0, 0($t4)		# load patient ID
		lw $s1, 4($t4)		# load the address of heap that contain tests' results
		
		beqz $s1, end_ex_search	# branch to end_search when search end without find any match
			
		# load name characters
    		lb $t5, 16($s1)		# load 1st character of name into $t5
   		lb $t6, 17($s1)		# load 2nd character of name into $t6
		
		beq $s0, $t0, match_id	# branch if current loaded ID match input ID
		j next_line_search	# Branch to next line
		
		match_id:
			la $t7, buffer	# load address of input buffer
			lb $t8, 0($t7)	# load 1st char from the buffer
			lb $t9, 1($t7)	# load 2nd char from the buffer
			lb $s2, 2($t7)	# load 3rd char from the buffer
			
			# Hgb Test
   			beq $t8, 'H', Hgb_match
   			
   			# LDL Test
   			beq $t8, 'L', LDL_match
   			
			# BGT Test
   			beq $t9, 'G', BGT_match
   			
			# BPT Test
   			beq $t9, 'P', BPT_match
   			
   			# unknown Test
   			j next_line_search	# Branch to next line
			
			Hgb_match:
				bne $t9, 'g', next_line_search	# Branch to next line
				bne $s2, 'b', next_line_search	# Branch to next line
				beq $t5, $t8, exist		# branch to exist when user input test name and loaded test name are matched
				j next_line_search		# Branch to next line
			
			LDL_match:
				bne $t9, 'D', next_line_search	# Branch to next line
				bne $s2, 'L', next_line_search	# Branch to next line
				beq $t5, $t8, exist		# branch to exist when user input test name and loaded test name are matched
				j next_line_search		# Branch to next line
			
			BGT_match:
				bne $t8, 'B', next_line_search	# Branch to next line
				bne $s2, 'T', next_line_search	# Branch to next line
				beq $t6, $t9, exist		# branch to exist when user input test name and loaded test name are matched
				j next_line_search		# Branch to next line
			
			BPT_match:
				bne $t8, 'B', next_line_search	# Branch to next line
				bne $s2, 'T', next_line_search	# Branch to next line
				beq $t6, $t9, exist		# branch to exist when user input test name and loaded test name are matched
				j next_line_search		# Branch to next line
			
	
			next_line_search:
				addiu $t2, $t2, 8	# point to next line (counter++)
				j loop_search
	
	end_ex_search:
		beqz $s5, not_exist		# if exist flag = 0 then there is no exist 
		beq $s5, 1, update_ex_test	# else if it is 1 then branch to update_test to select specific test
		jr $ra
	not_exist:		# not exist test to update
		prints(not_exist_msg)
		jr $ra		# return to the main function
	
	exist:			# exist test
		addiu $s5, $zero, 1	# set the flag to 1
		lw $t6, 0($s1)		# load year
 	  	lw $t7, 4($s1)		# load month
		lwc1 $f1, 8($s1)	# load 1st result => $f0 = heap[8]
		lwc1 $f2, 12($s1)	# load 2nd result => $f1 = heap[12]
		##################Printing...##########################
   		prints(new_line)	# print new line "\n"
   		printi($s0)		# print patient ID
   		prints(doubleq)		# print ":"
   		printc($t8)		# print 1st character of name
   		printc($t9)		# print 2nd character of name
   		printc($s2)		# print 3rd character of name
   		prints(comma_space)	# print ", "
   		printi($t6)		# print year
		prints(dash)		# print "-"
  		printi($t7)		# print month
   		prints(comma_space)	# print ", "
  		printf($f1)		# print 1st result
   		bne $t9, 'P', one_res1	# ignore 2nd result if test type not BPT
   		prints(comma_space)	# print ", "
   		printf($f2)		# print 2nd result
   		one_res1:		# if test type not BPT
   		prints(new_line)	# print new line "\n"
   		########################################################
		j next_line_search		# Branch to next line
	
	update_ex_test:	
		move $s5, $zero			# set update flag initially to zero
		prints(year_msg) 		# message to enter test year
  		scani()				# scan year
  		move $s3, $v0			# move year to $s3
  		prints(month_msg)		# message to enter month
  		scani()				# scan year
  		move $s4, $v0			# save test month in $s4
  		
  		la $t7, buffer	# load address of input buffer
		lb $t8, 0($t7)	# load 1st char from the buffer
		lb $t9, 1($t7)	# load 2nd char from the buffer
		lb $s2, 2($t7)	# load 3rd char from the buffer
			
  		la $t3, ID_array	# load the base address of the array
		move $t2, $zero		# counter for rows => i=0
					
		loop_update:
			add $t4, $t3, $t2	# &ID_array + i
		
			lw $s0, 0($t4)		# load patient ID
			lw $s1, 4($t4)		# load the address of heap that contain tests' results
		
			beqz $s1, update_done	# branch to update done
			
			# load name characters
    			lb $t5, 16($s1)		# load 1st character of name into $t5
   			lb $t6, 17($s1)		# load 2nd character of name into $t6
		
			beq $s0, $t0, match_pid	# branch if current loaded ID match input ID
			j next_exist	# Branch to next line
		
		match_pid:
  			bne $t9, $t6, next_exist	# Branch if loaded test does not match entered test
  			lw $t6, 0($s1)			# load year
 	  		lw $t7, 4($s1)			# load month
  			beq $s3, $t6, check_m_date	# to check entered year of date of the ID
   			j next_exist			# Branch to next line
   		check_m_date:				# check month
   			bne $s4, $t7, next_exist	# Branch to next line if not match month
   			bne $t9, 'P', update_one	# ignore 2nd result update if test type not BPT
			beq $t9, 'P', update_two	# when test type BPT update result two
   			
   		next_exist:
   			addiu $t2, $t2, 8	# point to next line (counter++)
   			j loop_update
 
		update_two:
			addiu $s5, $zero, 1	# set the flag to 1
			# Result 1
			prints(firstResult_msg)
			scanf()			# scan new result and save into $f0
			swc1 $f0, 8($s1)	# store new 1st result $f0 => heap[8]
		
			# Result 2
			prints(secondResult_msg)
			scanf()			# scan new result and save into $f0
			mov.s $f3, $f0
			swc1 $f3, 12($s1)	# store new 2nd result $f3 => heap[12]	
			j update_done		# updating finished
		
		update_one:
			addiu $s5, $zero, 1	# set the flag to 1
			prints(oneResult_msg)
			scanf()			# scan new result and save into $f0
			swc1 $f0, 8($s1)	# store new 1st result $f0 => heap[8]
		
		update_done:
			beqz $s5, update_return	# when result didnt updated dont display update message
		prints(updated_msg)
		jr $ra
		update_return:
			prints(no_updated_msg)
			j update_ex_test
		jr $ra		# return to the main function

#________________________________________________________________________________________________
#************** Case 6: Delete a test **************

delete:
	# Now $t6 = patient ID, and buffer =  test name
	la $t0, ID_array	# load the base address of the array
	move $t1, $zero		# counter for rows => i=0
			
	loop_del:
		add $t2, $t0, $t1	# &ID_array + i
		
		lw $s0, 0($t2)		# load patient ID
		lw $s1, 4($t2)		# load the address of heap that contain tests' results
		
		beqz $s0, not_exist_del	# branch when search end without find any match
		
		# load name characters
    		lb $t3, 16($s1)		# load 1st character of name into $t3
   		lb $t4, 17($s1)		# load 2nd character of name into $t4
   		lb $t5, 17($s1)		# load 3rd character of name into $t5
		
		beq $s0, $t6, del_id	# branch if current loaded ID match input ID
		j next_line_del		# Branch to next line
		
		del_id:
			la $t7, buffer	# load address of input buffer
			lb $t8, 0($t7)	# load 1st char from the buffer
			lb $t9, 1($t7)	# load 2nd char from the buffer
			lb $s2, 2($t7)	# load 3rd char from the buffer
			
			# Hgb Test
   			beq $t8, 'H', Hgb_del
   			
   			# LDL Test
   			beq $t8, 'L', LDL_del
   			
			# BGT Test
   			beq $t9, 'G', BGT_del
   			
			# BPT Test
   			beq $t9, 'P', BPT_del
   			
   			# unknown Test
   			j next_line_del		# Branch to next line
			
			Hgb_del:
				bne $t9, 'g', next_line_del	# Branch to next line
				bne $s2, 'b', next_line_del	# Branch to next line
				beq $t3, $t8, exist_del		# branch to exist when user input test name and loaded test name are matched
				j next_line_del			# Branch to next line
			
			LDL_del:
				bne $t9, 'D', next_line_del	# Branch to next line
				bne $s2, 'L', next_line_del	# Branch to next line
				beq $t3, $t8, exist_del		# branch to exist when user input test name and loaded test name are matched
				j next_line_del			# Branch to next line
			
			BGT_del:
				bne $t8, 'B', next_line_del	# Branch to next line
				bne $s2, 'T', next_line_del	# Branch to next line
				beq $t4, $t9, exist_del		# branch to exist when user input test name and loaded test name are matched
				j next_line_del			# Branch to next line
			
			BPT_del:
				bne $t8, 'B', next_line_del	# Branch to next line
				bne $s2, 'T', next_line_del	# Branch to next line
				beq $t4, $t9, exist_del		# branch to exist when user input test name and loaded test name are matched
				j next_line_del			# Branch to next line
			
	
			next_line_del:
				addiu $t1, $t1, 8	# point to next line (counter++)
				j loop_del
	
	not_exist_del:		# not exist test to delete
		prints(not_exist_msg)
		jr $ra		# return to the main function
	
	exist_del:			# exist test
		# Reseting values of current and then shifting
		# Reset ID
		sw $zero, 0($t2)
			
		# Reset Test Date
   		sw $zero, 0($s1)	# reset year
   		sw $zero, 4($s1)	# reset month
   	 	
   		# Reset Test Results
   		mtc1 $zero, $f0
   		swc1 $f0 , 8($s1)	# reset 1st result
   		swc1 $f0 , 12($s1)	# reset 2nd result
   	
   		# Reset Test Name characters
    		sw $zero, 16($s1)		# reset all characters of name directly	

		# Check if this test was last test stored
		addiu $t1, $t1, 8	# next test
		add $t8, $t0, $t1	# &ID_array + i
		lw $s2, 0($t8)		# load next patient ID
		beqz $s2, del_done	# branch when last test reached
		
		# Shifting directly next test to current position
		shift:
			# Now $t8 base address of next data while $t2 of deleted
			add $t8, $t0, $t1	# &ID_array + i

			########### Load data of next test ###########			
			# Load next ID
			lw $s2, 0($t8)		# load next patient ID
			
			# Load next heap
			lw $s3, 4($t8)		# load the next address of heap
			
			# Checking if next test is not exist
			beqz $s2, shift_done	# branch when last test reached

			# load next name characters
    			lb $t3, 16($s3)		# load 1st character of name into $t3
   			lb $t4, 17($s3)		# load 2nd character of name into $t4
   			lb $t5, 18($s3)		# load 3rd character of name into $t5
   			
   			# load next date
			lw $t6, 0($s3)		# load year
 	  		lw $t7, 4($s3)		# load month
		
			# load next results
			lwc1 $f1, 8($s3)	# load 1st result => $f0 = heap[8]
			lwc1 $f2, 12($s3)	# load 2nd result => $f1 = heap[12]
			
			########### Shift data of next test to current ###########
			# Store next ID
			sw $s2, 0($t2)
			
			# Store next Test Date
   			sw $t6, 0($s1)		# store year
   			sw $t7, 4($s1)		# store month
   	 	
   			# Store next Test Results
   			swc1 $f1 , 8($s1)	# store 1st result
   			swc1 $f2 , 12($s1)	# store 2nd result
   	
   			# Store next Test Name characters
    			sb $t3, 16($s1)		# store 1st character of name
   			sb $t4, 17($s1)		# store 2nd character of name
   			sb $t5, 18($s1)		# store 3rd character of name
			
			move $t2, $t8		# update current test to next
			move $s1, $s3		# update current heap to next
			
			addiu $t1, $t1, 8	# point to next test
			j shift
		
		shift_done:
			# Reseting ad deleting last repeated test 
			# Reset ID
			sw $zero, 0($t2)
			
			# Reset address of heap
			sw $zero, 4($t2)
			
			# Reset Test Date
   			sw $zero, 0($s1)	# reset year
   			sw $zero, 4($s1)	# reset month
   	 	
   			# Reset Test Results
   			mtc1 $zero, $f0
   			swc1 $f0 , 8($s1)	# reset 1st result
   			swc1 $f0 , 12($s1)	# reset 2nd result
   	
   			# Reset Test Name characters
    			sw $zero, 16($s1)		# reset all characters of name directly	
			prints(deleted_msg)
			jr $ra		# return to the main function
			
		del_done:
			# Reset address of heap
			sw $zero, 4($t2)	
			prints(deleted_msg)
			jr $ra		# return to the main function
	
#________________________________________________________________________________________________
#************** Reading from the file **************
			
read_file:			# function to open the file

	la $a0, file_location  	# address of null-terminated filename string
	li $a1, 0 		# read file
	li $a2, 0 		# ignored
	li $v0, 13 		# open file
	syscall
		
	bltz $v0, error_in_file		# branch if there is error in file, else continue
	
	move $t0, $v0  			# move fd into $t0
	syscall
	
	move $a0 , $t0  	# File descriptor		
	la $a1, in_data		# address of input data
	li $a2, 1200		# maximum number of characters to read
	li $v0 , 14 		# read from file
	syscall			
	
	# closing the file		
	move $a0, $t0 		# File descriptor      
  	li $v0, 16   		# close the file
  	syscall	
	jr $ra	
	
	# error when opening the file
	error_in_file: 
		prints(error_file_msg)		# display error message when file cannot opened
	jr  $ra

#________________________________________________________________________________________________
#************** Parsing and Saving in List **************

# => extract the data from the readed data from the file and save it in the linked list
save_in_list: 
   	
	la $t0 , in_data 	# load the address of the data that has been read from the file
	
   	move $t2 , $zero	# register to store the id
   	move $t3 , $zero	# register to store the 1st char of test name
   	move $t4 , $zero	# register to store the 2nd char of test name
   	move $t5 , $zero	# register to store the 3rd char of test name
   	move $t6 , $zero 	# register to store the year
 	move $t7 , $zero 	# register to store the month
 	move $t8 , $zero 	# register to convert neumarical result value
 	move $t9 , $zero 	# register to convert neumarical result value
 	
 	mtc1 $zero, $f0		# register to store the 1st result
 	mtc1 $zero, $f1		# register to store the 2nd result
 	
   	loop:	
   		lb $t1 , 0($t0)			# register to load each char. => $t1 = in_data[i]
   		
   		beqz $t1, end_of_data		# branch if the EOF reached
   		beq $t1 , '\n', eol
   		bne $t1, '-', parse_id		# branch if first char was not minus notation that is valid id
   		
   		handle_minus:			# to handle invalid id so it will ignore the notation
   			addiu	$t0, $t0, 1	# $t0 = address of next char
			lb $t1 , 0($t0)		# $t1 = in_data[i]
   				
   		parse_id:
   			beq $t1 , '\n', eol
		 	beq $t1 , '\r', eol
   			sub	$t1, $t1, 48	# Convert character to digit
			mul	$t2, $t2, 10	# $v0 = sum * 10
			addu	$t2, $t2, $t1	# $v0 = sum * 10 + digit
			
			addiu	$t0, $t0, 1	# $t0 = address of next char
			lb $t1 , 0($t0)		# $t1 = in_data[i]
			
			beq $t1, ':', parse_start 	# branch if the : reached (test name)
			j parse_id
			
		parse_start:
		 	beq $t1 , '\n', eol
		 	beq $t1 , '\r', eol
		 	beqz $t1 ,  end_of_data
   			
   			parse_name:
   				addiu $t0, $t0, 2      	# ignore ':' and space and point to 1st char of neme
   				lb $t1, 0($t0)      	# Load the first char of the test name
   				move $t3 , $t1 		# save the first char in $t3
   			
   				addiu $t0, $t0, 1	# $t0 = address of 2nd char
				lb $t1 , 0($t0) 	# Load the second char of the test name
				move $t4, $t1		# save the second char in $t4
			
				addiu $t0, $t0, 1	# $t0 = address of next char
				lb $t1 , 0($t0) 	# $t1 = in_data[i] = third char
				move $t5, $t1		# save the third char in $t5
   			
   			# move to year part to parse it
   			addiu $t0, $t0, 3      		# ignore ',' and space
   			lb $t1, 0($t0)      		# Load the first left digit of the year in $t1
   			
   			parse_year:	
				sub $t1, $t1, 48	# Convert character to digit	
				mul $t6, $t6, 10      	# $t6 = year * 10
  				addu $t6, $t6, $t1     	# $t6 = year * 10 + digit
  		  
  		  		addiu $t0, $t0, 1	# $t0 = address of next char
				lb $t1 , 0($t0) 	# $t1 = in_data[i]
			
				beq $t1 , '-', parse_year_end # branch if the - reached (month part)
				j parse_year
			
			parse_year_end:
				addiu   $t0, $t0, 1      # Move to the next character after -
   				lb      $t1, 0($t0)     # Load the first character of the month
   				
   				blt $t6, 1900, handle_year	# if year < 1900 then store it as 0 to notice that is invalid
   				bgt $t6, 2050, handle_year	# if year > 2050 then store it as 0 to notice that is invalid
   				j parse_month
   				handle_year:
   					move $t6 , $zero	# reset to zero
		
			parse_month:
				sub $t1, $t1, 48	# Convert character to digit	
				mul $t7, $t7, 10      	# $t7 = month * 10
  				addu $t7, $t7, $t1    	# $t7 = month * 10 + digit
  		  
  		  		addiu $t0, $t0, 1	# $t0 = address of next char
				lb $t1 , 0($t0) 	# $t1 = in_data[i]
			
				beq $t1 , ',', parse_month_end  # branch if the ',' reached (first result)
				j parse_month
			
			parse_month_end: 
				addiu   $t0, $t0, 2     # Move to the next character after , and space
   				lb      $t1, 0($t0)     # Load the first character of the first result
   				
   				blez $t7, handle_month		# if month <= 0 then store it as 0 to notice that is invalid
   				bgt $t7, 12, handle_month	# if month > 12 then store it as 0 to notice that is invalid
   				j parse_result1
   				handle_month:
   					move $t7 , $zero	# reset to zero
   			
   			parse_result1:
   				sub $t1, $t1, 48	# Convert character to digit	
				mul $t8, $t8, 10      	# $t8 = pre-decimal * 10
  				addu $t8, $t8, $t1    	# $t8 = pre-decimal * 10 + digit
  		  
  		  		addiu $t0, $t0, 1	# $t0 = address of next char
				lb $t1, 0($t0) 		# $t1 = in_data[i]
				
				beq $t1, '.', fractional_part		# branch to fractional part to compute
				beq $t1 , ',', complete_part		# branch if the ',' reached (first result)
				beq $t1 , '\n', complete_part			# branch to save when line ended
				beq $t1 , '\r', complete_part			# branch to save when line ended
				beqz $t1, complete_part				# branch if the EOF reached
				j parse_result1
				
				fractional_part:
					addiu $t0, $t0, 1	# $t0 = address of next char
					lb $t1, 0($t0) 		# $t1 = in_data[i]
					sub $t1, $t1, 48	# Convert character to digit	
					move $t9, $t1		# move fraction to $t9
  		  			
  		  			skip:				# to skip 2nd and other fraction digits
  		  				beq $t1 , '\n', complete_part	# branch to save when line ended
						beq $t1 , ',', complete_part	# branch if the ',' reached (first result end)
						beqz $t1, end_of_data		# branch if the EOF reached
  		  				
  		  				addiu $t0, $t0, 1	# $t0 = address of next char
						lb $t1 , 0($t0) 	# $t1 = in_data[i]
						
						j skip				# branch to skip loop
					
					# now $t8 = pre-decimal part and $t9 = post-decimal part, then Combine pre and post parts into a single float value
					complete_part:
						mtc1 $t8, $f0         # Move pre-decimal part to $f0
						cvt.s.w $f0, $f0      # Convert pre-decimal part to float
						
						mtc1 $t9, $f2         # Move post-decimal part to $f2
						cvt.s.w $f2, $f2      # Convert post-decimal part to float
    						
    						l.s $f3, exponent     # Load exponent to $f3
   						mul.s $f2, $f2, $f3   # Multiply post-decimal part by exponent
    						add.s $f0, $f0, $f2   # Add post-decimal part to pre-decimal part
    						
    						
					beq $t1 , '\n', save			# branch to save when line ended
					beq $t1 , '\r', save			# branch to save when line ended
					beq $t1 , ',', parse_result1_end	# branch if the ',' reached (first result)
					beqz $t1, save				# branch if the EOF reached
			
			parse_result1_end:
				addiu   $t0, $t0, 2     # Move to the next character after ',' and space
   				lb      $t1, 0($t0)     # Load the first character of the second result
   				
   				move $t8, $zero		# reset for next result if available
   				move $t9, $zero		# reset for next result if available
   			
   			parse_result2:
   				sub $t1, $t1, 48	# Convert character to digit	
				mul $t8, $t8, 10      	# $t8 = pre-decimal * 10
  				addu $t8, $t8, $t1    	# $t8 = pre-decimal * 10 + digit
  		  
  		  		addiu $t0, $t0, 1	# $t0 = address of next char
				lb $t1 , 0($t0) 	# $t1 = in_data[i]
				
				beq $t1, '.', fractional_part2		# branch to fractional part to compute
				beq $t1 , '\n', complete_part2		# branch to save when line ended
				beq $t1 , '\r', complete_part2		# branch to save when line ended
				beqz $t1, complete_part2		# branch if the EOF reached
				j parse_result2
				
				fractional_part2:
					addiu $t0, $t0, 1	# $t0 = address of next char
					lb $t1 , 0($t0) 	# $t1 = in_data[i]
					sub $t1, $t1, 48	# Convert character to digit	
					move $t9, $t1		# move fraction to $t9
  		  			
  		  			skip2:				# to skip 2nd and other fraction digits
  		  				beqz $t1, complete_part2		# branch if the EOF reached
  		  				beq $t1 , '\n', complete_part2	# branch to save when line ended
  		  				
  		  				addiu $t0, $t0, 1	# $t0 = address of next char
						lb $t1 , 0($t0) 	# $t1 = in_data[i]
						
						j skip2				# branch to skip loop
					
					# now $t8 = pre-decimal part and $t9 = post-decimal part, then Combine pre and post parts into a single float value
					complete_part2:
						mtc1 $t8, $f1         # Move pre-decimal part to $f1
						cvt.s.w $f1, $f1      # Convert pre-decimal part to float
						
						mtc1 $t9, $f2         # Move post-decimal part to $f2
						cvt.s.w $f2, $f2      # Convert post-decimal part to float
    						
    						l.s $f3, exponent     # Load exponent to $f3
   						mul.s $f2, $f2, $f3   # Multiply post-decimal part by exponent
    						add.s $f1, $f1, $f2   # Add post-decimal part to pre-decimal part
    						
				
   		save:				# all data for the node are ready in the registers to store it into linked list
   			sw $ra, 0($sp)  	# Save $ra on the stack
			addiu $sp, $sp, -4  	# Adjust the stack pointer
			jal add_node		# adding new node and store the data in registers into it
			
			 # Restore the return address
			addiu $sp, $sp, 4  	# Adjust the stack pointer
			lw $ra, 0($sp)  	# Restore $ra from the stack

   			j eol			# to reset the registers for new line data
   		
   		eol:				# EOL End Of Line reached
   			# Reset all registers
   			move $t2 , $zero 	# reset id to zero for new one
   			move $t6 , $zero 	# reset year to zero for new one
   			move $t7 , $zero 	# reset month to zero for new one
   			move $t8 , $zero 	# reset to zero for next use
   			move $t9 , $zero 	# reset to zero for next use
   			mtc1 $zero, $f0		# reset to zero for next 1st result
 			mtc1 $zero, $f1		# reset to zero for next 2nd result	
   			
   			beq $t1, '\r', car_r 	# if \r exist then it follows \n 
   			addiu   $t0, $t0, 1     # Move to the next character after \n
   			lb $t1 , 0($t0) 	# $t1 = in_data[i]
   			beqz $t1, end_of_data	# branch if the EOF reached
   			j loop
   				
   			car_r:				# to handle carriage return
   				addiu   $t0, $t0, 2     # Move to the next character after  \r and \n
   				lb $t1 , 0($t0) 	# $t1 = in_data[i]
   				beqz $t1, end_of_data	# branch if the EOF reached
   			j loop
   			  
   		 end_of_data:	  		  
	 		jr $ra 				# all data are saved
	 		
#________________________________________________________________________________________________
#************** Adding Node into the array and heap **************

#=======================================================================================
# $t2 = test id
# $t3 = 1st char of test name
# $t4 = 2nd char of test name
# $t5 = 3rd char of test name
# $t6 = test year
# $t7 = test month
# $f0 = 1st result of test
# $f1 = 2nd result of test
#=======================================================================================				
add_node:
	# Allocate memory for the new node
  	#  year | month | result1 | result2 | 1st char | 2nd char | 3rd char 
  	#  $t6    $t7      $f0       $f1        $t3         $t4          $t5      
  	
  	# save in ID array
  	# ID | address of other data
  	# $t2     address of heap
  	
	la $s0,ID_array         # load address of the first element of the array
	move $s1, $zero		# counter for rows => i=0
	
	adding_loop:
		add $s2, $s0, $s1	# &ID_array + i
		lw $s3, 0($s2)		# load patient ID
		beqz $s3, add_new	# branch to loop untill reach an empty cell to store the new test
		addi $s1, $s1, 8	# next line
		j adding_loop
	
	add_new:
	# Allocate memory location for the data
	li $a0, 24    		# load size of the node structure
  	li $v0, 9             	# syscall for memory allocation
   	syscall
   		
   	# Store Test Date
   	sw $t6, 0($v0)		# store year
   	sw $t7, 4($v0)		# store month
   	 	
   	# Store Test Results
   	swc1 $f0 , 8($v0)	# store 1st result
   	swc1 $f1 , 12($v0)	# store 2nd result
   	
   	# Store Test Name characters
    	sb $t3, 16($v0)		# store 1st character of name
   	sb $t4, 17($v0)		# store 2nd character of name
   	sb $t5, 18($v0)		# store 3rd character of name
   	
   	# Store Null pointer at last bytes	
	sw $zero, 20($v0)	# store Null Pointer,  node -> next = NULL
	
	# Store Test patient ID number in the array
	sw $t2, 0($s2)          # store the id in ID_array[i][0]
		
	# Store the address of other data linked list "data strcture" in second column in the array
	sw $v0, 4($s2)        	# store the address of the head of linked list that contain the id data
	
	jr $ra

#________________________________________________________________________________________________
#************** Printing the Data **************

print_data:
	la $s3, ID_array	# load the base address of the array
	move $s4, $zero		# counter for rows => i=0
	
	loop_print:
		add $s2, $s3, $s4	# &ID_array + i
		
		lw $s0, 0($s2)		# load patient ID
		lw $s1, 4($s2)		# load the address of heap that contain tests' results
		
		beq $s0, 0, done	# branch to done when there is no test
		
		# load name characters
    		lb $t3, 16($s1)		# load 1st character of name
   		lb $t4, 17($s1)		# load 2nd character of name
   		lb $t5, 18($s1)		# load 3rd character of name

		# load date
		lw $t6, 0($s1)		# load year
 	  	lw $t7, 4($s1)		# load month
		
		# load results
		lwc1 $f1, 8($s1)	# load 1st result => $f0 = heap[8]
		lwc1 $f2, 12($s1)	# load 2nd result => $f1 = heap[12]
   		
   		##################Printing...##########################
   			printi($s0)		# print patient ID
   			prints(doubleq)		# print ":"
   			printc($t3)		# print 1st character of name
   			printc($t4)		# print 2nd character of name
   			printc($t5)		# print 3rd character of name
   			prints(comma_space)	# print ", "
   			printi($t6)		# print year
   			prints(dash)		# print "-"
   			printi($t7)		# print month
   			prints(comma_space)	# print ", "
   			printf($f1)		# print 1st result
   			bne $t4, 'P', one_res	# ignore 2nd result if test type not BPT
   			prints(comma_space)	# print ", "
   			printf($f2)		# print 2nd result
   			one_res:		# if test type not BPT
   			prints(new_line)	# print new line "\n"
   		########################################################
   		
   		addiu $s4, $s4, 8	# point to next line (counter++)
   		j loop_print
   	 	
   	done:
   	jr $ra

#________________________________________________________________________________________________
#************** Saving updated data to the file **************

save_to_file:
	
	# Open the file
	la $a0, file_location  	# address of null-terminated filename string
	li $a1, 1 		# write in file
	li $a2, 0 		# ignored
	li $v0, 13 		# open file
	syscall
	
	bltz $v0, error_n_file		# branch if there is error in file, else continue
	move $t0, $v0  			# move fd into $t0
	syscall
	
	la $s3, ID_array	# load the base address of the array
	move $s4, $zero		# counter for rows => i=0
	
	la $s5, out_data	# load base address of out_data to write in it
	move $s6, $zero		# counter for number of bytes to store
	
	loop_save:

		add $s2, $s3, $s4	# &ID_array + i
		
		lw $s0, 0($s2)		# load patient ID
		lw $s1, 4($s2)		# load the address of heap that contain tests' results
		
		beq $s0, 0, add_null	# branch to add_null when there is no test
		
		# load name characters
    		lb $t3, 16($s1)		# load 1st character of name
   		lb $t4, 17($s1)		# load 2nd character of name
   		lb $t5, 18($s1)		# load 3rd character of name

		# load date
		lw $t6, 0($s1)		# load year
 	  	lw $t7, 4($s1)		# load month
		
		# load results
		lwc1 $f1, 8($s1)	# load 1st result => $f0 = heap[8]
		lwc1 $f2, 12($s1)	# load 2nd result => $f1 = heap[12]
   		
   		################## Storing in out_data... ##########################
   		# Store ID
   		li $s7, 0	# counter of digits
   		move $t2, $s0	# move ID to temp register to count
   		count_ID:
   			li $t1, 10		# load 10 into $t1
   			div $t2, $t1		# div by 10
   			mflo $t2		# set $t2 = $t2/10
   			addiu $s7, $s7, 1	# digits counter++
   			bnez $t2, count_ID	# branch if last digit no reached
   		
   		addiu $s7, $s7, -1		# count digits -1
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		store_ID:
   			li $t1, 10		# load 10 into $t1
   			div $s0, $t1		# div ID by 10 to extract digit into $t1
   			mfhi $t1          	# move the remainder "digit" from HI register to $t1
   			mflo $s0		# move the quotient into $s0 to reduce its digits
   			addiu $t1, $t1, 48	# add 48 to convert to ascii
   			sb $t1, 0($s5)		# store patient ID
   			
   			addiu $s5, $s5, -1	# to point to previous location of store
   			addiu $s6, $s6, -1	# bytes counter--
   			
   			bnez $s0, store_ID	# branch to store loop when its not zero
   		
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		addiu $s5, $s5, 2		# to point to next location of store
   		addiu $s6, $s6, 2		# bytes counter+=2
   		
   		# Store ': '
   		lb $s0, doubleq		# load ":"
		sb $s0, 0($s5)		# store ":"
		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
   		lb $s0, doubleq + 1	# load " "
		sb $s0, 0($s5)		# store " "
		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
		
		# Store 1st name char
   		sb $t3, 0($s5)		# store 1st character of name
   		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
   		
   		# Store 2nd name char
   		sb $t4, 0($s5)		# store 2nd character of name
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
   		
   		# Store 3rd name char
  		sb $t5, 0($s5)		# store 3rd character of name
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
  		
  		# Store comma and space ", "
  		la $t2, comma_space	# load address of comma and space
  		lb $t3, 0($t2)		# load comma
  		lb $t5, 1($t2)		# load space
  		sb $t3, 0($s5)		# store comma
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
  		sb $t5, 0($s5)		# store space
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
  		
		# Store year
		li $s7, 0	# counter of digits
   		move $t2, $t6	# move year to temp register to count
   		count_year:
   			li $t1, 10		# load 10 into $t1
   			div $t2, $t1		# div by 10
   			mflo $t2		# set $t2 = $t2/10
   			addiu $s7, $s7, 1	# digits counter++
   			bnez $t2, count_year	# branch if last digit no reached
   		
   		addiu $s7, $s7, -1		# count digits -1
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		store_year:
   			li $t1, 10		# load 10 into $t1
   			div $t6, $t1		# div year by 10 to extract digit into $t1
   			mfhi $t1          	# move the remainder "digit" from HI register to $t1
   			mflo $t6		# move the quotient into $t6 to reduce its digits
   			addiu $t1, $t1, 48	# add 48 to convert to ascii
   			sb $t1, 0($s5)		# store year
   			
   			addiu $s5, $s5, -1	# to point to previous location of store
   			addiu $s6, $s6, -1	# bytes counter--
   			
   			bnez $t6, store_year	# branch to store loop when its not zero
   		
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		addiu $s5, $s5, 2		# to point to next location of store
   		addiu $s6, $s6, 2		# bytes counter+=2
   		
   		# Store '-'
   		lb $t3, dash		# load dash
   		sb $t3, 0($s5)		# store "-"
   		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
   		
   		# Store month
   		bge $t7, 10, start_count_month	# branch if month 2 digits 
   		li $t1, 48			# load zero "ascii=48" into $t1
   		sb $t1, 0($s5)			# if not then store 0 before the single 
   		addiu $s5, $s5, 1		# to point to next location of store
   		addiu $s6, $s6, 1		# bytes counter++
   		addiu $t7, $t7, 48		# add 48 to convert to ascii
   		sb $t7, 0($s5)			# store month
   		addiu $s5, $s5, 1		# to point to next location of store
   		addiu $s6, $s6, 1		# bytes counter++
   		j store_comma			# skip checking month
   		
   		start_count_month:
   		li $s7, 0			# counter of digits
   		move $t2, $t7			# move month to temp register to count
   		count_month:
   			li $t1, 10		# load 10 into $t1
   			div $t2, $t1		# div by 10
   			mflo $t2		# set $t2 = $t2/10
   			addiu $s7, $s7, 1	# digits counter++
   			bnez $t2, count_month	# branch if last digit no reached
   		
   		addiu $s7, $s7, -1		# count digits -1
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		
   		store_month:
   			li $t1, 10		# load 10 into $t1
   			div $t7, $t1		# div month by 10 to extract digit into $t1
   			mfhi $t1          	# move the remainder "digit" from HI register to $t1
   			mflo $t7		# move the quotient into $t7 to reduce its digits
   			addiu $t1, $t1, 48	# add 48 to convert to ascii
   			sb $t1, 0($s5)		# store month
   			
   			addiu $s5, $s5, -1	# to point to previous location of store
   			addiu $s6, $s6, -1	# bytes counter--
   			
   			bnez $t7, store_month	# branch to store loop when its not zero
		
		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		addiu $s5, $s5, 2		# to point to next location of store
   		addiu $s6, $s6, 2		# bytes counter+=2
		
		# Store comma and space ", "
		store_comma:
  		la $t2, comma_space	# load address of comma and space
  		lb $t3, 0($t2)		# load comma
  		lb $t5, 1($t2)		# load space
  		sb $t3, 0($s5)		# store comma
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
  		sb $t5, 0($s5)		# store space
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
  		
  		# Store 1st Result
  		cvt.w.s $f3, $f1        # convert float to integer
  		mfc1 $t8, $f3           # move integer part into $t8
  		li $t1, 10		# load 10 into $t1
  		l.s $f3, exponent	# $f3 = 0.1
  		div.s $f1, $f1, $f3	# mul by 10 to extract post-decimal as last digit in 
  		cvt.w.s $f3, $f1        # convert float to integer
  		mfc1 $t9, $f3           # move integer part that last digit of it is the fractional part into $t9
  		div $t9, $t1		# div int by 10 to extract post-decimal digit
   		mfhi $t9          	# set $t9 = post-decimal digit
  		# now $t8 = pre-decimal integer, $t9 = post-decimal integer
  		# store $t8
  		li $s7, 0	# counter of digits
   		move $t2, $t8	# move res1 to temp register to count
   		count_res1:
   			li $t1, 10		# load 10 into $t1
   			div $t2, $t1		# div by 10
   			mflo $t2		# set $t2 = $t2/10
   			addiu $s7, $s7, 1	# digits counter++
   			bnez $t2, count_res1	# branch if last digit no reached
   		
   		addiu $s7, $s7, -1		# count digits -1
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
  		store_res1:
  			li $t1, 10		# load 10 into $t1
   			div $t8, $t1		# div int by 10 to extract digit into $t1
   			mfhi $t1          	# move the remainder "digit" from HI register to $t1
   			mflo $t8		# move the quotient into $t8 to reduce its digits
   			addiu $t1, $t1, 48	# add 48 to convert to ascii
   			sb $t1, 0($s5)		# store int part of 1st result
   			
   			addiu $s5, $s5, -1	# to point to previous location of store
   			addiu $s6, $s6, -1	# bytes counter--
   			
   			bnez $t8, store_res1	# branch to store loop when its not zero
   		
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		addiu $s5, $s5, 2		# to point to next location of store
   		addiu $s6, $s6, 2		# bytes counter+=2
   		
   		beqz $t9, skip_frac1	# branch to skip fractional part if it is zero
   		# Store '.'
   		lb $t3, dot		# load dot
   		sb $t3, 0($s5)		# store "."
   		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
   		
   		# store $t9
   		addiu $t9, $t9, 48	# add 48 to convert to ascii
   		sb $t9, 0($s5)		# store fract. part of 1st result
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
		
		skip_frac1:
   		bne $t4, 'P', res1	# ignore 2nd result if test type not BPT
   		
   		# Store comma and space ", "
  		la $t2, comma_space	# load address of comma and space
  		lb $t3, 0($t2)		# load comma
  		lb $t5, 1($t2)		# load space
  		sb $t3, 0($s5)		# store comma
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
  		sb $t5, 0($s5)		# store space
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
  		
  		# Store 2nd Result
  		cvt.w.s $f3, $f2        # convert float to integer
  		mfc1 $t8, $f3           # move integer part into $t8
  		li $t1, 10		# load 10 into $t1
  		l.s $f3, exponent	# $f3 = 0.1
  		div.s $f2, $f2, $f3	# mul by 10 to extract post-decimal as last digit in 
  		cvt.w.s $f3, $f2        # convert float to integer
  		mfc1 $t9, $f3           # move integer part that last digit of it is the fractional part into $t9
  		div $t9, $t1		# div int by 10 to extract post-decimal digit
   		mfhi $t9          	# set $t9 = post-decimal digit
  		
  		# now $t8 = pre-decimal integer, $t9 = post-decimal integer
  		# store $t8
  		li $s7, 0	# counter of digits
   		move $t2, $t8	# move res2 to temp register to count
   		count_res2:
   			li $t1, 10		# load 10 into $t1
   			div $t2, $t1		# div by 10
   			mflo $t2		# set $t2 = $t2/10
   			addiu $s7, $s7, 1	# digits counter++
   			bnez $t2, count_res2	# branch if last digit no reached
   		
   		addiu $s7, $s7, -1		# count digits -1
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
  		store_res2:
  			li $t1, 10		# load 10 into $t1
   			div $t8, $t1		# div int by 10 to extract digit into $t1
   			mfhi $t1          	# move the remainder "digit" from HI register to $t1
   			mflo $t8		# move the quotient into $t8 to reduce its digits
   			addiu $t1, $t1, 48	# add 48 to convert to ascii
   			sb $t1, 0($s5)		# store int part of 2nd result
   			
   			addiu $s5, $s5, -1	# to point to previous location of store
   			addiu $s6, $s6, -1	# bytes counter--
   			
   			bnez $t8, store_res2	# branch to store loop when its not zero
   		
   		addu $s5, $s5, $s7		# to point to next location of store
   		addu $s6, $s6, $s7		# bytes counter++
   		addiu $s5, $s5, 2		# to point to next location of store
   		addiu $s6, $s6, 2		# bytes counter+=2
   		
   		beqz $t9, skip_frac2	# branch to skip fractional part if it is zero
   		# Store '.'
   		lb $t3, dot		# load dot
   		sb $t3, 0($s5)		# store "."
   		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
   		
   		# store $t9
   		addiu $t9, $t9, 48	# add 48 to convert to ascii
   		sb $t9, 0($s5)		# store fract. part of 2nd result
  		addiu $s5, $s5, 1	# to point to next location of store
   		addiu $s6, $s6, 1	# bytes counter++
		
		skip_frac2:
   		
   		res1:		# if test type not BPT
   			lb $t3, new_line	# load "\n"
   			sb $t3, 0($s5)		# store new line "\n"
			addiu $s5, $s5, 1	# to point to next location of store
   			addiu $s6, $s6, 1	# bytes counter++
   		####################################################################
   		
   		addiu $s4, $s4, 8	# point to next line (counter++)
   		j loop_save
	
	add_null:	
		li $t3, 0		# load zero into $t3
		sb $t3, 0($s5)		# store NULL to represent end of file
		addiu $s6, $s6, -1	# bytes counter-- to not store last \n
		
	move $a0 , $t0  	# File descriptor		
	la $a1, out_data	# address of output data
	move $a2, $s6		# maximum number of characters to write which is in $s6 and just it need to store
	li $v0 , 15 		# write to file
	syscall			
	
	# closing the file		
	move $a0, $t0 		# File descriptor      
  	li $v0, 16   		# close the file
  	syscall	
	jr $ra
	
	# error when opening the file
	error_n_file: 
		prints(error_file_msg)		# display error message when file cannot opened
	jr  $ra

#________________________________________________________________________________________________



