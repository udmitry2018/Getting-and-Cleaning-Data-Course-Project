acc_x <- scan('./data/run_analysis/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt', nmax = 10)
acc_y <- scan('./data/run_analysis/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt', nmax = 10)
acc_z <- scan('./data/run_analysis/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt', nmax = 10)

gyro_x <- scan('./data/run_analysis/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt', nmax = 10)
gyro_y <- scan('./data/run_analysis/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt', nmax = 10)
gyro_z <- scan('./data/run_analysis/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt', nmax = 10)

df1 <- data.frame(acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z)

acc_x <- scan('./data/run_analysis/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt', nmax = 10)
acc_y <- scan('./data/run_analysis/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt', nmax = 10)
acc_z <- scan('./data/run_analysis/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt', nmax = 10)

gyro_x <- scan('./data/run_analysis/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt', nmax = 10)
gyro_y <- scan('./data/run_analysis/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt', nmax = 10)
gyro_z <- scan('./data/run_analysis/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt', nmax = 10)

df2 <- data.frame(acc_x, acc_y, acc_z, gyro_x, gyro_y, gyro_z)

df <- rbind(df1, df2)

head(df, 10)
str(df)
typeof(df)

sapply(df, sd)
sapply(df, mean)


#write.table(mydf, "./data/run_analysis/result.txt",  row.name=FALSE)