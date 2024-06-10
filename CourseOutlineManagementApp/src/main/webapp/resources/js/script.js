document.addEventListener('DOMContentLoaded', () => {
    const initializePageParams = () => {
        const urlParams = new URLSearchParams(window.location.search);
        let needsRedirect = false;

        if (!urlParams.has('pageLecturer')) {
            urlParams.set('pageLecturer', '1');
            needsRedirect = true;
        }
        if (!urlParams.has('pageStudent')) {
            urlParams.set('pageStudent', '1');
            needsRedirect = true;
        }
        if (needsRedirect) {
            const newUrl = `${window.location.pathname}?${urlParams.toString()}`;
            window.history.replaceState({}, '', newUrl);
//            location.reload();
        }
    };

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
                location.reload();
            });
        });
    };

    const scrollToSectionFromQueryParams = () => {
        const urlParams = new URLSearchParams(window.location.search);
        const lecturerPage = urlParams.get('pageLecturer');
        const studentPage = urlParams.get('pageStudent');

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
        }
    };

    initializePageParams();
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