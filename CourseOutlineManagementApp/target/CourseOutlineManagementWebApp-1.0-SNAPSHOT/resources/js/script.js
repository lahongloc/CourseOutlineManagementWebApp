document.addEventListener('DOMContentLoaded', () => {
    // Lấy phần tử select theo id
    var selectElementFaculty = document.getElementById('facultyId');
    var selectElementLecturer = document.getElementById('lecturerId');

    // Lưu giá trị ban đầu của select
    var initialValueFaculty = '';
    var initialValueLecturer = '';

    // Lắng nghe sự kiện change (sự thay đổi giá trị của select)
    selectElementFaculty.addEventListener('change', function () {
        // Nếu giá trị đã được chọn, lưu vào biến initialValueFaculty
        if (selectElementFaculty.value !== '') {
            initialValueFaculty = selectElementFaculty.value;
        }
    });
    selectElementLecturer.addEventListener('change', function () {
        // Nếu giá trị đã được chọn, lưu vào biến initialValueLecturer
        if (selectElementLecturer.value !== '') {
            initialValueLecturer = selectElementLecturer.value;
        }
    });

    // Gán giá trị ban đầu cho select
    selectElementFaculty.value = initialValueFaculty;
    selectElementLecturer.value = initialValueLecturer;

    // giữ urlParam page
    const updateUrlParam = (key, value) => {
        const urlParams = new URLSearchParams(window.location.search);
        urlParams.set(key, value);
        const newUrl = `${window.location.pathname}?${urlParams.toString()}`;
        window.history.pushState({}, '', newUrl);
    };

    const setupPaginationLinks = () => {
        document.querySelectorAll('.page-link').forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const url = new URL(link.href);
                const urlParams = url.searchParams;

                if (urlParams.has('pageLecturer')) {
                    updateUrlParam('pageLecturer', urlParams.get('pageLecturer'));
                }
                if (urlParams.has('pageStudent')) {
                    updateUrlParam('pageStudent', urlParams.get('pageStudent'));
                }
                if (urlParams.has('pageOutline')) {
                    updateUrlParam('pageOutline', urlParams.get('pageOutline'));
                }
                location.reload();
            });
        });
    };

    const scrollToSectionFromQueryParams = () => {
        const urlParams = new URLSearchParams(window.location.search);
        const lecturerPage = urlParams.get('pageLecturer');
        const studentPage = urlParams.get('pageStudent');
        const outlinePage = urlParams.get('pageOutline');

        if (lecturerPage) {
            const lecturersSection = document.getElementById('lecturers-section');
            if (lecturersSection) {
                const topPosition = lecturersSection.getBoundingClientRect().top + window.pageYOffset;
                window.scrollTo({
                    top: topPosition,
                    behavior: 'smooth'
                });
            }
        } else if (studentPage) {
            const studentsSection = document.getElementById('students-section');
            if (studentsSection) {
                const topPosition = studentsSection.getBoundingClientRect().top + window.pageYOffset;
                window.scrollTo({
                    top: topPosition,
                    behavior: 'smooth'
                });
            }
        } else if (outlinePage) {
            const outlinesSection = document.getElementById('outlines-section');
            if (outlinesSection) {
                const topPosition = studentsSection.getBoundingClientRect().top + window.pageYOffset;
                window.scrollTo({
                    top: topPosition,
                    behavior: 'smooth'
                });
            }
        }
    };

    scrollToSectionFromQueryParams();
    setupPaginationLinks();
});

// Hàm phê duyệt người dùng
const userApprove = (isActive, url, name) => {
    if (isActive === true) {
        alert("Tài khoản này đã được phê duyệt!");
    } else if (confirm(`Phê duyệt cho tài khoản ${name}?`) === true) {
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(() => {
            localStorage.setItem('scrollPosition', window.scrollY);
            location.reload();
        });
    }
};

function deleteProduct(url, id) {
    fetch(url, {
        method: 'delete'
    }).then(res => {
        if (res.status === 204)
            location.reload();
        else
            alert("ERROR");
    });
}

//function drawChartRevenue(ctx, labels, data, title="Doanh thu") {
//    let colors = [];
//    for (let i = 0; i < data.length; i++)
//        colors.push(`rgba(${parseInt(Math.random()*255)}, 
//        ${parseInt(Math.random()*255)}, 
//        ${parseInt(Math.random()*255)}, 0.7)`);
//    
//    new Chart(ctx, {
//        type: 'bar',
//        data: {
//            labels: labels,
//            datasets: [{
//                    label: title,
//                    data: data,
//                    borderWidth: 1,
//                    backgroundColor: colors
//                }]
//        },
//        options: {
//            scales: {
//                y: {
//                    beginAtZero: true
//                }
//            }
//        }
//    });
//}