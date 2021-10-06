" command! FileEncodeReopenWithWinCyrilic :e ++enc=cp1251
command! EncodeDetectThis :!chardet3 %
command! EncodingSupportedShow :help encoding-values
command! FileEncodingShow :echo &fileencoding?&fileencoding:&encoding
