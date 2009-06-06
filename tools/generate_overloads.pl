@levels = ('Log', 'Trace','Debug','Info','Warn','Error','Fatal');
@clitypes = ('System.Boolean','System.Char','System.Byte','System.String','System.Int32','System.Int64','System.Single','System.Double','System.Decimal','System.Object');
@nonclstypes = ('System.SByte','System.UInt32','System.UInt64');

$loggercs = "../src/NLog/Logger.cs";

open(IN, "<$loggercs");
open(OUT, ">$loggercs.tmp");
while (<IN>)
{
    print OUT;
    last if (m/the following code has been automatically generated by a PERL/);
}

for $level (@levels) {

    if ($level eq "Log") {
        $level2 = "level";
        $level3 = "specified";
        $isenabled = "this.IsEnabled(level)";
        $arg0 = "LogLevel level, ";
        $param0 = qq!\n        /// <param name="level">The log level.</param>!;
    } else {
        $level2 = "LogLevel.$level";
        $level3 = "<c>$level</c>";
        $isenabled = "this.Is${level}Enabled";
        $arg0 = "";
        $param0 = "";
    }


    print OUT <<EOT;
        #region $level() overloads 

        /// <overloads>
        /// Writes the diagnostic message at the $level3 level using the specified format provider and format parameters.
        /// </overloads>
        /// <summary>
        /// Writes the diagnostic message at the $level3 level.
        /// </summary>$param0
        /// <param name="value">The value to be written.</param>
        public void $level<T>(${arg0}T value)
        {
            if ($isenabled)
            {
                this.WriteToTargets($level2, null, value);
            }
        }

        /// <overloads>
        /// Writes the diagnostic message at the $level3 level using the specified format provider and format parameters.
        /// </overloads>
        /// <summary>
        /// Writes the diagnostic message at the $level3 level.
        /// </summary>$param0
        /// <param name="formatProvider">An IFormatProvider that supplies culture-specific formatting information.</param>
        /// <param name="value">The value to be written.</param>
        public void $level<T>(${arg0}IFormatProvider formatProvider, T value)
        {
            if ($isenabled)
            {
                this.WriteToTargets($level2, formatProvider, value);
            }
        }

        /// <overloads>
        /// Writes the diagnostic message at the $level3 level using the specified format provider and format parameters.
        /// </overloads>
        /// <summary>
        /// Writes the diagnostic message at the $level3 level.
        /// </summary>$param0
        /// <param name="messageDelegate">A function returning message to be written. Function is not evaluated if logging is not enabled.</param>
        public void $level(${arg0}LogMessageDelegate messageDelegate)
        {
            if ($isenabled)
            {
                this.WriteToTargets($level2, null, messageDelegate());
            }
        }

        /// <summary>
        /// Writes the diagnostic message and exception at the $level3 level.
        /// </summary>$param0
        /// <param name="message">A <see langword="string" /> to be written.</param>
        /// <param name="exception">An exception to be logged.</param>
        public void ${level}Exception(${arg0}string message, Exception exception)
        {
            if ($isenabled)
            {
                this.WriteToTargets($level2, message, exception);
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified parameters and formatting them with the supplied format provider.
        /// </summary>$param0
        /// <param name="formatProvider">An IFormatProvider that supplies culture-specific formatting information.</param>
        /// <param name="message">A <see langword="string" /> containing format items.</param>
        /// <param name="args">Arguments to format.</param>
        public void $level(${arg0}IFormatProvider formatProvider, string message, params object[] args)
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, formatProvider, message, args); 
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified parameters.
        /// </summary>$param0
        /// <param name="message">A <see langword="string" /> containing format items.</param>
        /// <param name="args">Arguments to format.</param>
        public void $level(${arg0}string message, params object[] args) 
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, message, args);
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified parameter and formatting it with the supplied format provider.
        /// </summary>
        /// <typeparam name="T1">The type of the first argument.</typeparam>$param0
        /// <param name="formatProvider">An IFormatProvider that supplies culture-specific formatting information.</param>
        /// <param name="message">A <see langword="string" /> containing one format item.</param>
        /// <param name="argument">The argument to format.</param>
        public void $level<T1>(${arg0}IFormatProvider formatProvider, string message, T1 argument)
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, formatProvider, message, new object[] { argument }); 
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified parameter.
        /// </summary>
        /// <typeparam name="T1">The type of the first argument.</typeparam>$param0
        /// <param name="message">A <see langword="string" /> containing one format item.</param>
        /// <param name="argument">The <see cref="T:$t" /> argument to format.</param>
        public void $level<T1>(${arg0}string message, T1 argument)
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, message, new object[] { argument });
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified arguments formatting it with the supplied format provider.
        /// </summary>
        /// <typeparam name="T1">The type of the first argument.</typeparam>
        /// <typeparam name="T2">The type of the second argument.</typeparam>$param0
        /// <param name="formatProvider">An IFormatProvider that supplies culture-specific formatting information.</param>
        /// <param name="message">A <see langword="string" /> containing one format item.</param>
        /// <param name="argument1">The first argument to format.</param>
        /// <param name="argument2">The second argument to format.</param>
        public void $level<T1, T2>(${arg0}IFormatProvider formatProvider, string message, T1 argument1, T2 argument2) 
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, formatProvider, message, new object[] { argument1, argument2 }); 
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified parameters.
        /// </summary>
        /// <typeparam name="T1">The type of the first argument.</typeparam>
        /// <typeparam name="T2">The type of the second argument.</typeparam>$param0
        /// <param name="message">A <see langword="string" /> containing one format item.</param>
        /// <param name="argument1">The first argument to format.</param>
        /// <param name="argument2">The second argument to format.</param>
        public void $level<T1, T2>(${arg0}string message, T1 argument1, T2 argument2)
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, message, new object[] { argument1, argument2 });
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified arguments formatting it with the supplied format provider.
        /// </summary>
        /// <typeparam name="T1">The type of the first argument.</typeparam>
        /// <typeparam name="T2">The type of the second argument.</typeparam>
        /// <typeparam name="T3">The type of the third argument.</typeparam>$param0
        /// <param name="formatProvider">An IFormatProvider that supplies culture-specific formatting information.</param>
        /// <param name="message">A <see langword="string" /> containing one format item.</param>
        /// <param name="argument1">The first argument to format.</param>
        /// <param name="argument2">The second argument to format.</param>
        /// <param name="argument3">The third argument to format.</param>
        public void $level<T1, T2, T3>(${arg0}IFormatProvider formatProvider, string message, T1 argument1, T2 argument2, T3 argument3) 
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, formatProvider, message, new object[] { argument1, argument2, argument3 }); 
            }
        }

        /// <summary>
        /// Writes the diagnostic message at the $level3 level using the specified parameters.
        /// </summary>
        /// <typeparam name="T1">The type of the first argument.</typeparam>
        /// <typeparam name="T2">The type of the second argument.</typeparam>
        /// <typeparam name="T3">The type of the third argument.</typeparam>$param0
        /// <param name="message">A <see langword="string" /> containing one format item.</param>
        /// <param name="argument1">The first argument to format.</param>
        /// <param name="argument2">The second argument to format.</param>
        /// <param name="argument3">The third argument to format.</param>
        public void $level<T1, T2, T3>(${arg0}string message, T1 argument1, T2 argument2, T3 argument3)
        { 
            if ($isenabled)
            {
                this.WriteToTargets($level2, message, new object[] { argument1, argument2, argument3 });
            }
        }

        #endregion

EOT


}

while (<IN>)
{
    if (m/end of generated code/)
    {
        print OUT;
        last;
    }
}

while (<IN>)
{
    print OUT;
}
close(OUT);
close(IN);
unlink($loggercs);
rename("$loggercs.tmp", "$loggercs");

