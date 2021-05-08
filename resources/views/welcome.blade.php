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
                    <form>
                        <div class="column">
                            <form action="/action_page.php">
                                <textarea id="subject" name="subject"
                                    placeholder="Enter text or Upload file to check for plagarism..."
                                    style="height:170px;width: 900px;margin-left: -131px;"></textarea>
                                <a href="Report.html"><button type="button" class="btn btn-info">Check For
                                        Plagarism</button></a>
                            </form>
                        </div>
                    </form>
                </div>
                <ul style="color: rgb(240, 204, 3); margin-left: 90px;font-size: 18px;font-weight: bolder;">
                    <li> Significant plagiarism found
                        Ensure your work is fresh and original by checking it against 16 billion web pages. </li><br>
                    <li> Spelling </li> <br>
                    <li> Correct </li> <br>
                    <li> Punctuation </li> <br>
                    <li> Conciseness </li> <br>
                    <li> Readability </li> <br>
                    <li> Word choice </li> <br>
                    <li> Additional writing issues </li> <br>
                </ul>
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
