//
//  ViewController.m
//  DayLightDemo
//
//  Created by dipak on 6/24/16.
//  Copyright © 2016 Dipak. All rights reserved.
//

//
//DisplayName = "(UTC-08:00) Baja California";
//Id = "Pacific Standard Time (Mexico)";
//
#import "ViewController.h"
#define DATE_FORMAT_WITH_TIME_AND_TIMEZONE                  @"MMM dd, yyyy HH:mm Z"
#define DATE_FORMAT                                         @"MMM dd, yyyy HH:mm"

@interface ViewController ()
@property (nonatomic, strong) NSString *serverTimeZone;
@property (nonatomic, strong) NSString *userTimeZone;
@property (nonatomic, strong) NSString *dateString;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSArray *timeZoneArray  = @[@"(UTC-11:00) Coordinated Universal Time-11", @"UTC-11",@"(UTC-10:00) Hawaii",@"Hawaiian Standard Time",@"(UTC-09:00) Alaska",@"Alaskan Standard Time",@"(UTC-08:00) Baja California",@"Pacific Standard Time (Mexico)",@"(UTC-08:00) Pacific Time (US & Canada)",@"Pacific Standard Time",@"(UTC-07:00) Arizona",@"US Mountain Standard Time",@"(UTC-07:00) Chihuahua, La Paz, Mazatlan",@"Mountain Standard Time (Mexico)",@"(UTC-07:00) Mountain Time (US & Canada)",@"Mountain Standard Time",@"(UTC-06:00) Central America",@"Central America Standard Time",@"(UTC-06:00) Central Time (US & Canada)",@"Central Standard Time",@"(UTC-06:00) Guadalajara, Mexico City, Monterrey",@"Central Standard Time (Mexico)",@"(UTC-06:00) Saskatchewan",@"Canada Central Standard Time",@"(UTC-05:00) Bogota, Lima, Quito, Rio Branco",@"SA Pacific Standard Time",@"(UTC-05:00) Chetumal",@"Eastern Standard Time (Mexico)",@"(UTC-05:00) Eastern Time (US & Canada)",@"Eastern Standard Time",@"(UTC-05:00) Indiana (East)",@"US Eastern Standard Time",@"(UTC-04:30) Caracas",@"Venezuela Standard Time",@"(UTC-04:00) Asuncion",@"Paraguay Standard Time",@"(UTC-04:00) Atlantic Time (Canada)",@"Atlantic Standard Time",@"(UTC-04:00) Cuiaba",@"Central Brazilian Standard Time",@"(UTC-04:00) Georgetown, La Paz, Manaus, San Juan",@"SA Western Standard Time",@"(UTC-03:30) Newfoundland",@"Newfoundland Standard Time",@"(UTC-03:00) Brasilia",@"E. South America Standard Time",@"(UTC-03:00) Cayenne, Fortaleza",@"SA Eastern Standard Time",@"(UTC-03:00) City of Buenos Aires",@"Argentina Standard Time",@"(UTC-03:00) Greenland",@"Greenland Standard Time",@"(UTC-03:00) Montevideo",@"Montevideo Standard Time",@"(UTC-03:00) Salvador",@"Bahia Standard Time",@"(UTC-03:00) Santiago",@"Pacific SA Standard Time",@"(UTC-02:00) Coordinated Universal Time-02",@"UTC-02",@"(UTC-02:00) Mid-Atlantic - Old",@"Mid-Atlantic Standard Time"];
    //},
    //{
    //    DisplayName = "(UTC-01:00) Azores";
    //    Id = "Azores Standard Time";
    //},
    //{
    //    DisplayName = "(UTC-01:00) Cabo Verde Is.";
    //    Id = "Cape Verde Standard Time";
    //},
    //{
    //    DisplayName = "(UTC) Casablanca";
    //    Id = "Morocco Standard Time";
    //},
    //{
    //    DisplayName = "(UTC) Coordinated Universal Time";
    //    Id = UTC;
    //},
    //{
    //    DisplayName = "(UTC) Dublin, Edinburgh, Lisbon, London";
    //    Id = "GMT Standard Time";
    //},
    //{
    //    DisplayName = "(UTC) Monrovia, Reykjavik";
    //    Id = "Greenwich Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna";
    //    Id = "W. Europe Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague";
    //    Id = "Central Europe Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+01:00) Brussels, Copenhagen, Madrid, Paris";
    //    Id = "Romance Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+01:00) Sarajevo, Skopje, Warsaw, Zagreb";
    //    Id = "Central European Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+01:00) West Central Africa";
    //    Id = "W. Central Africa Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+01:00) Windhoek";
    //    Id = "Namibia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Amman";
    //    Id = "Jordan Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Athens, Bucharest";
    //    Id = "GTB Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Beirut";
    //    Id = "Middle East Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Cairo";
    //    Id = "Egypt Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Damascus";
    //    Id = "Syria Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) E. Europe";
    //    Id = "E. Europe Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Harare, Pretoria";
    //    Id = "South Africa Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius";
    //    Id = "FLE Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Istanbul";
    //    Id = "Turkey Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Jerusalem";
    //    Id = "Israel Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Kaliningrad (RTZ 1)";
    //    Id = "Kaliningrad Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+02:00) Tripoli";
    //    Id = "Libya Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+03:00) Baghdad";
    //    Id = "Arabic Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+03:00) Kuwait, Riyadh";
    //    Id = "Arab Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+03:00) Minsk";
    //    Id = "Belarus Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+03:00) Moscow, St. Petersburg, Volgograd (RTZ 2)";
    //    Id = "Russian Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+03:00) Nairobi";
    //    Id = "E. Africa Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+03:30) Tehran";
    //    Id = "Iran Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+04:00) Abu Dhabi, Muscat";
    //    Id = "Arabian Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+04:00) Baku";
    //    Id = "Azerbaijan Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+04:00) Izhevsk, Samara (RTZ 3)";
    //    Id = "Russia Time Zone 3";
    //},
    //{
    //    DisplayName = "(UTC+04:00) Port Louis";
    //    Id = "Mauritius Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+04:00) Tbilisi";
    //    Id = "Georgian Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+04:00) Yerevan";
    //    Id = "Caucasus Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+04:30) Kabul";
    //    Id = "Afghanistan Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+05:00) Ashgabat, Tashkent";
    //    Id = "West Asia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+05:00) Ekaterinburg (RTZ 4)";
    //    Id = "Ekaterinburg Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+05:00) Islamabad, Karachi";
    //    Id = "Pakistan Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi";
    //    Id = "India Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+05:30) Sri Jayawardenepura";
    //    Id = "Sri Lanka Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+05:45) Kathmandu";
    //    Id = "Nepal Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+06:00) Astana";
    //    Id = "Central Asia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+06:00) Dhaka";
    //    Id = "Bangladesh Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+06:00) Novosibirsk (RTZ 5)";
    //    Id = "N. Central Asia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+06:30) Yangon (Rangoon)";
    //    Id = "Myanmar Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+07:00) Bangkok, Hanoi, Jakarta";
    //    Id = "SE Asia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+07:00) Krasnoyarsk (RTZ 6)";
    //    Id = "North Asia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+08:00) Beijing, Chongqing, Hong Kong, Urumqi";
    //    Id = "China Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+08:00) Irkutsk (RTZ 7)";
    //    Id = "North Asia East Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+08:00) Kuala Lumpur, Singapore";
    //    Id = "Singapore Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+08:00) Perth";
    //    Id = "W. Australia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+08:00) Taipei";
    //    Id = "Taipei Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+08:00) Ulaanbaatar";
    //    Id = "Ulaanbaatar Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+08:30) Pyongyang";
    //    Id = "North Korea Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+09:00) Osaka, Sapporo, Tokyo";
    //    Id = "Tokyo Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+09:00) Seoul";
    //    Id = "Korea Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+09:00) Yakutsk (RTZ 8)";
    //    Id = "Yakutsk Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+09:30) Adelaide";
    //    Id = "Cen. Australia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+09:30) Darwin";
    //    Id = "AUS Central Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+10:00) Brisbane";
    //    Id = "E. Australia Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+10:00) Canberra, Melbourne, Sydney";
    //    Id = "AUS Eastern Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+10:00) Guam, Port Moresby";
    //    Id = "West Pacific Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+10:00) Hobart";
    //    Id = "Tasmania Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+10:00) Magadan";
    //    Id = "Magadan Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+10:00) Vladivostok, Magadan (RTZ 9)";
    //    Id = "Vladivostok Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+11:00) Chokurdakh (RTZ 10)";
    //    Id = "Russia Time Zone 10";
    //},
    //{
    //    DisplayName = "(UTC+11:00) Solomon Is., New Caledonia";
    //    Id = "Central Pacific Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+12:00) Anadyr, Petropavlovsk-Kamchatsky (RTZ 11)";
    //    Id = "Russia Time Zone 11";
    //},
    //{
    //    DisplayName = "(UTC+12:00) Auckland, Wellington";
    //    Id = "New Zealand Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+12:00) Coordinated Universal Time+12";
    //    Id = "UTC+12";
    //},
    //{
    //    DisplayName = "(UTC+12:00) Fiji";
    //    Id = "Fiji Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+12:00) Petropavlovsk-Kamchatsky - Old";
    //    Id = "Kamchatka Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+13:00) Nuku'alofa";
    //    Id = "Tonga Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+13:00) Samoa";
    //    Id = "Samoa Standard Time";
    //},
    //{
    //    DisplayName = "(UTC+14:00) Kiritimati Island";
    //    Id = "Line Islands Standard Time";
    //}
    //);
    //error =         {
    //    eDetail = "";
    //    eExceptionDetail = "";
    //    eID = NA;
    //};
    //};
    //}
    //
   // NSLog(@"knownTimeZoneNames:-------%@\n\n\n\n\n\n", [NSTimeZone knownTimeZoneNames]);
   // NSLog(@"abbreviationDictionary:-------%@\n\n\n\n\n\n", [NSTimeZone abbreviationDictionary]);
    
    self.serverTimeZone = @"UTC+05:30";
    self.userTimeZone = @"UTC-08:00";
    self.dateString = @"Jul 01, 2016 12:06";

    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSDate *date = [NSDate date];
   // [self handleDayLightSavingWithDate:date andDateFormattor:timeZone];
    [self testDayLight];

  //  [self convertDateStringToServerTimezoneDate:self.dateString];
}

- (void)testDayLight
{
    



   /* NSString *dateString = [NSString stringWithFormat:@"%@ %@",self.dateString,self.serverTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:DATE_FORMAT_WITH_TIME_AND_TIMEZONE];
    NSDate *dateInServerTimezone = [dateFormatter dateFromString:dateString];*/
    
   // [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"America/Chicago"]];

   // NSString *tz = @"Europe/Paris"; - //Working
     //NSString *tz = @"America/Chicago"; //Working
   // NSString *tz = @"Asia/Kolkata"; //Working


    //NSString *tz = @"UTC-6:00"; //- Not Working
    //
    NSString *tz = @"GMT+5:30"; //Time Zone is valid but not getting daylight info


     //DisplayName = "(UTC-08:00) Baja California";
     //Id = "Pacific Standard Time (Mexico)";
    
   // for (NSString *tz in timeZoneArray) {
        
     //NSString *tz = @"UTC-08:00"; //Time Zone is valid but not getting daylight info
     //NSString *tz = @"Pacific Standard Time";


    NSLog(@"1------timeZoneWithName:%@", [NSTimeZone timeZoneWithName:tz]);
    NSLog(@"2------timeZoneWithAbbreviation:%@", [NSTimeZone timeZoneWithAbbreviation:tz]);
    NSLog(@"3------initWithName:%@ \n",[[NSTimeZone alloc] initWithName:tz]);

    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:tz];
    NSLog(@"4------isDaylightSavingTime................: %d",[timeZone isDaylightSavingTime]);
    NSLog(@"5------description................: %@",timeZone.description);
    NSLog(@"6------abbreviation................: %@",timeZone.abbreviation);
    NSLog(@"7------name................: %@",timeZone.name);


    NSString *dateString = [NSString stringWithFormat:@"%@ %@",self.dateString,self.serverTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:DATE_FORMAT_WITH_TIME_AND_TIMEZONE];
    NSDate *dateInServerTimezone = [dateFormatter dateFromString:dateString];

    NSLog(@"dateFormatter.timeZone:%@", dateFormatter.timeZone);
    NSLog(@"dateString:%@, timeZone:%@, dateInServerTimezone:%@\n\n\n\n\n\n",dateString, dateFormatter.timeZone, dateInServerTimezone);
    [self handleDayLightSavingWithDate:dateInServerTimezone andDateFormattor:dateFormatter.timeZone];
   // }

}

//This method can be used wherever date has to assign to uidatepicker
-(NSDate *)convertDateStringToServerTimezoneDate:(NSString *)dateStr
{
    NSString *dateString = [NSString stringWithFormat:@"%@ %@",dateStr,self.serverTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:DATE_FORMAT_WITH_TIME_AND_TIMEZONE];
    NSDate *dateInServerTimezone = [dateFormatter dateFromString:dateString];
    NSLog(@"dateFormatter.timeZone:%@", dateFormatter.timeZone);
    NSLog(@"API date:%@, server timeZone:%@, dateInServerTimezone:%@\n\n\n\n\n\n",dateStr, self.serverTimeZone, dateInServerTimezone);
    [self handleDayLightSavingWithDate:dateInServerTimezone andDateFormattor:dateFormatter.timeZone];
    [self convertDateToStringValue:dateInServerTimezone andDateFormat:DATE_FORMAT];
    return dateInServerTimezone;
}

//This method can be used to get string value from uidatepicker date
-(NSString *)convertDateToStringValue:(NSDate *)dateValue andDateFormat:(NSString*)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *posix = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:posix];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:self.userTimeZone]];
    NSString *dateString = [dateFormatter stringFromDate:dateValue];
    NSLog(@"dateFormatter.timeZone:%@", dateFormatter.timeZone);
    
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC-08:00"];
    [dateFormatter setTimeZone:timeZone];
    NSLog(@"dateFormatter.timeZone:%@, timeZone:%@", dateFormatter.timeZone, timeZone);

    NSLog(@"dateString:%@\n\n\n\n\n\n", dateString);
    [self handleDayLightSavingWithDate:dateValue andDateFormattor:dateFormatter.timeZone];
    return dateString;
}

-(void)handleDayLightSavingWithDate:(NSDate *)date andDateFormattor:(NSTimeZone *)timeZone {
    NSLog(@"Date:%@, timeZone:%@",date, timeZone);
    BOOL isDayLightSavingTime = [timeZone  isDaylightSavingTimeForDate:date];
    NSLog(@"----isDaylightSavingTimeForDate................: %d",isDayLightSavingTime);
    NSLog(@"----isDaylightSavingTime................: %d",[timeZone isDaylightSavingTime]);
    NSLog(@"daylightSavingTimeOffsetForDate................: %f\n\n\n\n\n\n", ([timeZone daylightSavingTimeOffsetForDate:date])/60);
}

//This method can be used wherever date and time to be displayed in UI (date from API response is converting to user preferred timezone)
-(NSString *)convertResponseDateToUserPreferredTimezoneDateString:(NSString *)responseDateStr andDateFormat:(NSString *)dateFormat
{
    NSString *responseDateString = [NSString stringWithFormat:@"%@ %@",responseDateStr,self.serverTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:DATE_FORMAT_WITH_TIME_AND_TIMEZONE];
    
    NSDate *dateObject = [dateFormatter dateFromString:responseDateString];
    [dateFormatter setDateFormat:dateFormat];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:self.userTimeZone];
    return [dateFormatter stringFromDate: dateObject];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
