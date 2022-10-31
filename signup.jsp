<%-- 
    Document   : signup
    Created on : 30-Oct-2022, 11:11:09 am
    Author     : phanendra Lanki
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!--Materialize css library -->
        <!-- Compiled and minified CSS -->
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>     
        
    </head>
    
    <!--<body style="background: url(images/bg.jpg); background-size: cover; background-attachment: fixed;">-->
    <body>
        <div class="container">
            <div class="row">
                <!--m6 - medium and upper-->
                <!--12 columns - m6 means only 6 columns-->
                <!--offset-m3 means here we have in 6 columns leave three columns on left and right-->
                
                <!--To bring center-->
                
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px;" class="center-align">Register Here</h3>
                            
                            <!--to align the successful message in center-->
                            <!--To make text green after successfully registered-->
                            
                            <h5 id="msg" class="center-align"></h5>
                            
                            <!--To place submit button center I have used center-align-->
                            
                            <div class="form center-align"> 
                                
                                <!--creating form-->
                                
                                <form action="Register" method="post" id="myform">
                                    <input type="text" name="reg_num" placeholder="Enter your Regestration ID" >
                                    <input type="text" name="user_name" placeholder="Enter user name">
                                    <input type="number" name="mobile" placeholder="Enter your mobile number">
                                    <input type="email" name="user_email" placeholder="Enter your Email">
                                    <input type="password" name="user_password" placeholder="Enter your password" >
                                    <input type="password" name="new-password" placeholder="Enter your password again" >
                                    <button type="submit" class="btn light-blue darken-4">Submit</button>
                                </form>
                                
                                
                                
                            </div>

                            <!--loader-->
                            <!--TO bring the loader to center use center-align-->
                            
                            <div class="loader center-align" style="margin-top:10px; display: none;">
                                
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-red">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>

                                    <div class="spinner-layer spinner-green">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!--<h5 id="msg">Please wait...</h5>-->
                                
                            </div>

                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>

        <!--jquery CDN-->
        <!--jquery library-->
        <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous"></script>
        
        <!--To check whether the jquery is working or not--> 
        
        <script>
            
            $(document).ready(function (){
                
                console.log("page is ready.....");
                
                //To catch the form using AJAX JQuery
                //catch the form with id given in form
                
                /* Grabbing section */
                //grab the form with #myform (id of the form)
                //submit the form or call the event by on('submit')
                //when we submit the form we will get the object of the event 
                
                $("#myform").on('submit',function(event){
                    //to stop this form going to the next servlet(next page)
                    event.preventDefault();         
                    
                    //To get all the details of our form 
                    //this means our form i.e %myform the Grabbing section
                    //serialize our object
                    
                    var f = $(this).serialize();
                    
                    //.serialize() means our form will converts completely into string in the elements 
                    //will be in the form of key value pairs
                    
                    console.log(f);
                    
                    /*To show the loader that we added */
                    /*loader will be added after entering the data by clicking the submit button */
                    
                    /*
                     * 
                     *  
                     *  Loader Code   
                     *  
                     *     
                     *      
                     */
                    
                    $(".loader").show();
                    
                    //To show the loader in the form logic is written in Register Servlet
                    
                     /*
                     * 
                     *  
                     *  Loader Code   
                     *  
                     *     
                     *   
                     */
                         
                   /* To Hide the Form */
                         /* 
                          * 
                          * Code for Hiding the Registration Form
                          * 
                          * */
                         
                     $(".form").hide();
                         
                          /* 
                          * 
                          * Code for Hiding the Registration Form
                          * 
                          * */
                    
                    //Ajax request
                    //pass the object of JavaScript
                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POST',
                        
                        /* if the form is succesfully submitted*/
                        
                        success: function(data,textStatus,jqXHR){
                            console.log(data);
                            console.log("success...........");
                            
                            /* for showing form again after submitting  */
                            
                            $(".loader").hide();
                            $(".form").show();
                            
                            //To check the data is stored or not 
                            if(data.trim()==='done')
                            {
                                $('#msg').html("successfully Registered.....");
                                
                                /* To make text green after successfully registered */
                                
                                $("#msg").addClass('green-text');
                                
                            }else
                            {
                                $('#msg').html("Something went wrong on server.....");
                                
                               /* To make text error after getting any error */
                               
                                 $("#msg").addClass('red-text');
                                 
                            }
                            
                        },
                        /* If the form has any problem to submit or to store the data */
                        error: function(jqXHR, textStatus, errorThrown){
                            console.log(data);
                            console.log("error.............");
                            
                             /* for showing form again after submitting  */
                            
                            $(".loader").hide();
                            $(".form").show();
                            
                            $('#msg').html("Something went wrong on server.....");
                            
                             /* To make text error after getting any error */
                               
                                 $("#msg").addClass('red-text');
                        }
                    });
                    
                });
                
            });
            
        </script>
    </body>
</html>
