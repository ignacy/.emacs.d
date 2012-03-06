;; empty for now
(add-hook 'java-mode-hook (lambda () (subword-mode)))

(when set-java-paths-on-windows
  (when on-windows
    (setenv "JUNIT_HOME" "/home/ignacy/code/classpath")
    (setenv "JAVA_HOME" "c://jdk1.6.0_23")
    (setenv "CLASSPATH" "$CLASSPATH:$JUNIT_HOME:/home/ignacy/code/classpath:/home/ignacy/code/FyreTv/lib/test/testng-5.14.7.jar")))

(unless on-windows
  (defcustom android-mode-sdk-dir "~/android"
    "Set to the directory containing the Android SDK."
    :type 'string
    :group 'android-mode))

(when on-windows
  (defcustom android-mode-sdk-dir "c:/Android/android-sdk/"
    "Set to the directory containing the Android SDK."
    :type 'string
    :group 'android-mode))


(defcustom android-mode-avd "@htc"
  "Default AVD to use."
  :type 'string
  :group 'android-mode)

(unless on-windows
  (defun ant-compile ()
    "Traveling up the path, find build.xml file and run compile."
    (interactive)
    (with-temp-buffer
      (while (and (not (file-exists-p "build.xml"))
                  (not (equal "/" default-directory)))
        (cd ".."))
      (call-interactively 'compile))))
