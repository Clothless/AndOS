class IOS {
      func isDeviceJailbroken(bundleId: String) -> Bool {
          // Check for common jailbreak files
          let paths = [
              "/Applications/Cydia.app",
              "/Library/MobileSubstrate/MobileSubstrate.dylib",
              "/bin/bash",
              "/usr/sbin/sshd",
              "/etc/apt",
              "/private/var/lib/apt/"
          ]
          for path in paths {
              if FileManager.default.fileExists(atPath: path) {
                  return true
              }
          }

          // Check if the app can access restricted files
          let stringToWrite = "Jailbreak Test"
          do {
              try stringToWrite.write(toFile: "/private/jailbreak.txt", atomically: true, encoding: .utf8)
              // If the write is successful, the device is jailbroken
              return true
          } catch {
              // Unable to write, so the device is not jailbroken
          }

          // Check if the app can open Cydia URL scheme
          if let url = URL(string: "cydia://package/"+bundleId) {
              if UIApplication.shared.canOpenURL(url) {
                  return true
              }
          }

          return false
      }

      // Check if the app is running in debug mode
      func isAppInDebugMode() -> Bool {
          #if DEBUG
          return true
          #else
          return false
          #endif
      }

      // Check if the app is running on an emulator
      func isRunningOnEmulator() -> Bool {
          #if targetEnvironment(simulator)
          return true
          #else
          return false
          #endif
      }

      func isRuntimeTampered() -> Bool {
          let suspiciousLibraries = [
              "FridaGadget",
              "libcycript",
              "SubstrateLoader"
          ]

          for library in suspiciousLibraries {
              if dlopen(library, RTLD_NOW) != nil {
                  return true
              }
          }

          return false
      }

      // Check if Frida is detected (common hooking tool)
      func isFridaDetected() -> Bool {
          // Check for Frida-specific environment variables
          let env = ProcessInfo.processInfo.environment
          if env["DYLD_INSERT_LIBRARIES"]?.contains("Frida") == true {
              return true
          }

          // Check for Frida-specific files
          let paths = [
              "/usr/lib/frida",
              "/usr/lib/frida/frida-agent.dylib"
          ]
          for path in paths {
              if FileManager.default.fileExists(atPath: path) {
                  return true
              }
          }

          return false
      }

      // Check if the app is being debugged
      func isAppBeingDebugged() -> Bool {
          var info = kinfo_proc()
          var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
          var size = MemoryLayout<kinfo_proc>.size
          let sysctlResult = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
          if sysctlResult != 0 {
              return false
          }
          return (info.kp_proc.p_flag & P_TRACED) != 0
      }

  }
