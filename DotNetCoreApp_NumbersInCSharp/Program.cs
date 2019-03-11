using System;

namespace NumbersInCSharp
{
    class Program
    {
		
		static void WorkingWithIntegers()
		{
		    int a = 18;
			int b = 6;
			int c = a + b;
			Console.WriteLine(c);
			
			c = a - b;
			Console.WriteLine(c);
			c = a * b;
			Console.WriteLine(c);
			c = a / b;
			Console.WriteLine(c);
		}	
		
		static void OrderPrecedence()
		{
			int a = 5;
			int b = 4;
			int c = 2;
			int d = a + b * c;
			Console.WriteLine(d);
			
			d = (a  + b) * c;
			Console.WriteLine(d);
			
			d = (a + b) - 6 * c + (12 * 4) / 3 + 12;
			Console.WriteLine(d);
			
			int e = 7;
			int f = 4;
			int g = 3;
			int h = (e  + f) / g;
			Console.WriteLine(h);
		}
		
		static void TestLimits()
		{
			int a = 7;
			int b = 4;
			int c = 3;
			int d = (a + b) / c;
			int e = (a + b) % c;
			Console.WriteLine($"quotient: {d}");
			Console.WriteLine($"remainder: {e}");
			
			int max = int.MaxValue;
			int min = int.MinValue;
			Console.WriteLine($"The range of integers is {min} to {max}");
						
			int what = max + 3;
			Console.WriteLine($"An example of overflow: {what}");
		}
		
		static void NumericDataTypes()
		{
			double a = 5;
			double b = 4;
			double c = 2;
			double d = (a  + b) / c;
			Console.WriteLine(d);
			
			double max = double.MaxValue;			
			double min = double.MinValue;
			Console.WriteLine($"The range of double is {min} to {max}");
			
			double third = 1.0 / 3.0;
			Console.WriteLine(third);
			
			decimal decMin = decimal.MinValue;
			decimal decMax = decimal.MaxValue;
			Console.WriteLine($"The range of the decimal type is {decMin} to {decMax}");
			
			double dblA = 1.0;
			double dblB = 3.0;
			Console.WriteLine(dblA / dblB);

			decimal decC = 1.0M;
			decimal decD = 3.0M;
			Console.WriteLine(decC / decD);			
		}
		
		static void CircleArea()
		{
			double radiusCentimeters = 2.5;
			double circleArea = Math.Pow(radiusCentimeters,2) * Math.PI;
			Console.WriteLine($"{circleArea} SQR Centimeters");
		}
			
        static void Main(string[] args)
        {

		}
    }
}
