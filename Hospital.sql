USE [Hospital]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/10/2021 4:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[building] [int] NOT NULL,
	[financing] [money] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diseases]    Script Date: 11/10/2021 4:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diseases](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[severity] [int] NOT NULL,
 CONSTRAINT [PK_Diseases] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 11/10/2021 4:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[phone] [char](10) NULL,
	[salary] [money] NOT NULL,
	[surname] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Examinations]    Script Date: 11/10/2021 4:23:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examinations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dayOfWeek] [int] NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Examinations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF_Departments_financing]  DEFAULT ((0)) FOR [financing]
GO
ALTER TABLE [dbo].[Diseases] ADD  CONSTRAINT [DF_Diseases_severity]  DEFAULT ((1)) FOR [severity]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK_Building] CHECK  (([building]>=(1) AND [building]<=(5)))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK_Building]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK_Financing] CHECK  (([financing]>=(0)))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK_Financing]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK_Name] CHECK  ((NOT [name] like '% %'))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK_Name]
GO
ALTER TABLE [dbo].[Diseases]  WITH CHECK ADD  CONSTRAINT [CK_DiseaseName] CHECK  ((NOT [name] like '% %'))
GO
ALTER TABLE [dbo].[Diseases] CHECK CONSTRAINT [CK_DiseaseName]
GO
ALTER TABLE [dbo].[Diseases]  WITH CHECK ADD  CONSTRAINT [CK_Severity] CHECK  (([severity]>=(1)))
GO
ALTER TABLE [dbo].[Diseases] CHECK CONSTRAINT [CK_Severity]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [CK_DoctorName] CHECK  ((NOT [name] like '% %'))
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [CK_DoctorName]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [CK_Salary] CHECK  (([salary]>(0)))
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [CK_Salary]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [CK_Surname] CHECK  ((NOT [surname] like '% %'))
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [CK_Surname]
GO
ALTER TABLE [dbo].[Examinations]  WITH CHECK ADD  CONSTRAINT [CK_DayOfWeek] CHECK  (([dayOfWeek]>=(1) AND [dayOfWeek]<=(7)))
GO
ALTER TABLE [dbo].[Examinations] CHECK CONSTRAINT [CK_DayOfWeek]
GO
ALTER TABLE [dbo].[Examinations]  WITH CHECK ADD  CONSTRAINT [CK_EndTime] CHECK  (([endTime]>[startTime]))
GO
ALTER TABLE [dbo].[Examinations] CHECK CONSTRAINT [CK_EndTime]
GO
ALTER TABLE [dbo].[Examinations]  WITH CHECK ADD  CONSTRAINT [CK_ExaminationName] CHECK  ((NOT [name] like '% %'))
GO
ALTER TABLE [dbo].[Examinations] CHECK CONSTRAINT [CK_ExaminationName]
GO
ALTER TABLE [dbo].[Examinations]  WITH CHECK ADD  CONSTRAINT [CK_StartTime] CHECK  (([startTime]>='8:00:00' AND [startTime]<='18:00:00'))
GO
ALTER TABLE [dbo].[Examinations] CHECK CONSTRAINT [CK_StartTime]
GO
