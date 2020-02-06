<div class="container-main">
    <div class="students-wrap">
        <div class="students-images">
            @for($i = 0; $i < 2; $i++)
                <div class="students-images-column">
                    <div class="students-images-item">
                        <img src="{{ asset('/image/student1.jpg') }}" alt="">
                        <div class="student-content">
                            <p class="student-name">Maria Hill</p>
                            <p class="student-department">Software developer in GlobalLogic</p>
                        </div>
                    </div>

                    <div class="students-images-item">
                        <img src="{{ asset('/image/student2.jpg') }}" alt="">
                        <div class="student-content">
                            <p class="student-name">Maria Hill</p>
                            <p class="student-department">Software developer in GlobalLogic</p>
                        </div>
                    </div>
                </div>
            @endfor
        </div>
        <div class="students-text">
            <p class="lined-title">Наші студенти</p>
            <p class="students-description">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
            <a href="#" class="main-btn">Дізнатись більше</a>
        </div>
    </div>
</div>
