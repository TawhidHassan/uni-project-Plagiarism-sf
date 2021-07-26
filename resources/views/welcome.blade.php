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
                    <p>Plagiarism detection or content similarity detection is the process of locating instances of
                        plagiarism and/or copyright infringement within a work or document.The widespread use of
                        computers and the advent of the Internet have made it easier to plagiarize the work of others.
                        Detection of plagiarism can be undertaken in a variety of ways. Human detection is the most
                        traditional form of identifying plagiarism from written work.This can be a lengthy and
                        time-consuming task for the reader and can also result in inconsistencies in how plagiarism is
                        identified within an organization.</p>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                    <form role="form" id="userFrom" method="POST" action="{{ route('app.search') }}">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <textarea id="projectName" name="project_name"
                                    placeholder="Enter text or Upload file to check for plagarism..."
                                    style="height: 150px; width:500px"></textarea>
                                <br />
                                <a href="{{ url('/searchDescription') }}" type="button" label="Reset" class="btn btn-secondary"
                                        id="reset"><i class="fas fa-search"></i>Search By Description</a>
                                <button type="button" label="Reset" class="btn btn-danger" 
                                   id="reset"><i class="fas fa-redo"></i>Reset</button>

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
