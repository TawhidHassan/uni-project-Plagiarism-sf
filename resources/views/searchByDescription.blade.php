@extends('layouts.frontend.app')

@section('content')
    <div class="container">

        <!-- Masthead-->
        <header class="masthead text-white text-center">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <h1 class="mb-5">EUB plagiarism Checker Application</h1>
                        <p>Search your project by Description</p>
                    </div>
                    <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                        <form role="form" id="userFrom" method="POST" action="{{ route('app.searchDescription') }}">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                <textarea id="projectDes" name="project_des"
                                          placeholder="Enter text or Upload file to check for plagarism..."
                                          style="height: 150px; width:500px"></textarea>
                                    <br />


                                    <x-forms.button type="submit" label="Check" icon-class="fas fa-plus-circle" />

                                </div>
                            </div>
                        </form>
                    </div>
                    <div style="color: rgb(240, 204, 3); margin-left: 90px;font-size: 18px;font-weight: bolder;" id="result">
                        <h2>Significant plagiarism found
                            Ensure your work is fresh and original by checking it against EUB thesis DataBase. </h2><br><hr>
                        <span style="text-align: center" id="listRes">  </span>

                    </div>
                </div>
            </div>
        </header>

        <!-- Footer-->
        <footer class="footer" style="margin-top:100px">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 h-200 text-center text-lg-left my-auto">
                        <p class=" small mb-4 mb-lg-0" style="color:white;font-size: 20px;">© Sifat-Sakib-Mili 2021. All
                            Rights Reserved.</p>
                    </div>

                </div>
            </div>
        </footer>

    </div>
@endsection
