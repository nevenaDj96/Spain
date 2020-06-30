using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Email;
using Application.Queries;
using DataAccess;
using Implementation.Commands.CategoryEfCommands;
using Implementation.Commands.CommentEfCommands;
using Implementation.Commands.LikeCommEfCommands;
using Implementation.Commands.LikeEfCommands;
using Implementation.Commands.PictureEfCommands;
using Implementation.Commands.PostEfCommands;
using Implementation.Commands.RoleEfCommands;
using Implementation.Commands.UserEfCommands;
using Implementation.Email;
using Implementation.Logging;
using Implementation.Queries;
using Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Spain.Core;

namespace Spain
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
             var appSettings = new AppConfiguration();

            Configuration.Bind(appSettings);


            services.AddTransient <Context>();

            services.AddTransient<ICreateUserCommand, CreateUserEfCommand>();
            services.AddTransient<IEditUserCommand, EditUserEfCommand>();
            services.AddTransient<IDeleteUserCommand, DeleteUserEfCommand>();

            services.AddTransient<ICreateRoleCommand, CreateRoleEfCommand>();
            services.AddTransient<IEditRoleCommand, EditRoleEfCommand>();
            services.AddTransient<IDeleteRoleCommand, DeleteRoleEfCommand>();

            services.AddTransient<ICreatePostCommand, CreatePostEfCommand>();
            services.AddTransient<IEditPostCommand, EditPostEfCommand>();
            services.AddTransient<IDeletePostCommand, DeletePostEfCommand>();

            services.AddTransient<ICreatePictureCommand, CreatePictureEfCommand>();
            services.AddTransient<IEditPictureCommand, EditPictureEfCommand>();
            services.AddTransient<IDeletePictureCommand, DeletePictureEfCommand>();

            services.AddTransient<ICreateLikeCommand, CreateLikeEfCommand>();
            services.AddTransient<IDeleteLikeCommand, DeleteLikeEfCommand>();

            services.AddTransient<ICreateLikeCommCommand, CreateLikeCommEfCommand>();
            services.AddTransient<IDeleteLikeCommCommand, DeleteLikeCommEfCommand>();

            services.AddTransient<ICreateCommentComand, CreateCommentEfCommand>();
            services.AddTransient<IDeleteCommentCommand, DeleteCommentEfCommand>();
            services.AddTransient<IEditCommentCommand, EditCommentEfCommand>();

            services.AddTransient<ICreateCategoryCommand, CreateCategoryEfCommand>();
            services.AddTransient<IEditCategoryCommand, EditCategoryEfCommand>();
            services.AddTransient<IDeleteCategoryCommand, DeleteCategoryEfCommand>();

            services.AddTransient<IGetUserQuery, GetUserEfQuery>();
            services.AddTransient<IGetUsersQuery, GetUsersEfQuery>();

            services.AddTransient<IGetPostQuery, GetPostEfQuery>();
            services.AddTransient<IGetPostsQuery, GetPostsEfQuery>();

            services.AddTransient<IGetCommentQuery, GetCommentEfQuery>();
            services.AddTransient<IGetCommentsQuery, GetCommentsEfQuery>();

            services.AddTransient<IGetCategoryQuery, GetCategoryEfQuery>();
            services.AddTransient<IGetCategoriesQuery, GetCategoriesEfQuery>();


            services.AddHttpContextAccessor();
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();


                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;
            });

            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();

            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<CreateUserValidator>();
            services.AddTransient<CreatePostValidator>();
            services.AddTransient<CreateRoleValidator>();
            services.AddTransient<CreateCommentValidator>();
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<CreateLikeValidator>();
            services.AddTransient<CreateLikeCommValidator>();
            services.AddTransient<CreatePictureValidator>();





            services.AddTransient<JwtManager>(x =>
            {
                var context = x.GetService<Context>();

                return new JwtManager(context, appSettings.JwtIssuer, appSettings.JwtSecretKey);
            });

        


        services.AddTransient<IEmailSender, SmtpEmailSender>(x => new SmtpEmailSender(appSettings.EmailFrom, appSettings.EmailPassword));

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
        cfg.RequireHttpsMetadata = false;
        cfg.SaveToken = true;
        cfg.TokenValidationParameters = new TokenValidationParameters
        {
            ValidIssuer = appSettings.JwtIssuer,
            ValidateIssuer = true,
            ValidAudience = "Any",
            ValidateAudience = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(appSettings.JwtSecretKey)),
            ValidateIssuerSigningKey = true,
            ValidateLifetime = true,
            ClockSkew = TimeSpan.Zero
        };
    });

            services.AddControllers();
        }

// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseStaticFiles();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
