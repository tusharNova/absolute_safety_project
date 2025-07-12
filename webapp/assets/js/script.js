
// Loading Animation
window.addEventListener('load', function () {
    setTimeout(function () {
        document.getElementById('loadingOverlay').classList.add('hidden');
    }, 1000);
});

// Initialize AOS
AOS.init({
    duration: 1000,
    once: true,
    offset: 50
});

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Navbar scroll effect
window.addEventListener('scroll', function () {
    const navbar = document.getElementById('navbar');
    const backToTop = document.getElementById('backToTop');

    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
        backToTop.style.display = 'block';
    } else {
        navbar.classList.remove('scrolled');
        backToTop.style.display = 'none';
    }
});

// Back to top functionality
document.getElementById('backToTop').addEventListener('click', function () {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

// Form animations
document.querySelectorAll('.form-control').forEach(input => {
    input.addEventListener('focus', function () {
        this.style.transform = 'scale(1.02)';
    });

    input.addEventListener('blur', function () {
        this.style.transform = 'scale(1)';
    });
});

// Counter animation
function animateCounter(element, start, end, duration) {
    let current = start;
    const range = end - start;
    const increment = end > start ? 1 : -1;
    const step = Math.abs(Math.floor(duration / range));
    const obj = element;
    const timer = setInterval(() => {
        current += increment;
        obj.textContent = current + '+';
        if (current == end) {
            clearInterval(timer);
        }
    }, step);
}

// Trigger counter animation when in view
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const counters = entry.target.querySelectorAll('.stats-number');
            counters.forEach(counter => {
                const target = parseInt(counter.textContent);
                animateCounter(counter, 0, target, 2000);
            });
            observer.unobserve(entry.target);
        }
    });
});

document.querySelectorAll('.stats-item').forEach(item => {
    observer.observe(item);
});

// Parallax effect for hero section
window.addEventListener('scroll', function () {
    const scrolled = window.pageYOffset;
    const parallax = document.querySelector('.hero-section');
    if (parallax) {
        parallax.style.transform = `translateY(${scrolled * 0.5}px)`;
    }
});

// Add hover effects to cards
document.querySelectorAll('.feature-card, .contact-item').forEach(card => {
    card.addEventListener('mouseenter', function () {
        this.style.transform = 'translateY(-10px) scale(1.02)';
    });

    card.addEventListener('mouseleave', function () {
        this.style.transform = 'translateY(0) scale(1)';
    });
});

// Enhanced loading screen
const loadingMessages = [
    "Initializing Safety Systems...",
    "Loading Certification Database...",
    "Preparing Your Experience...",
    "Almost Ready..."
];

let messageIndex = 0;
const messageInterval = setInterval(() => {
    if (messageIndex < loadingMessages.length) {
        // You can add a message display element if needed
        messageIndex++;
    } else {
        clearInterval(messageInterval);
    }
}, 500);

// Mobile menu enhancement
const navbarToggler = document.querySelector('.navbar-toggler');
const navbarCollapse = document.querySelector('.navbar-collapse');

if (navbarToggler) {
    navbarToggler.addEventListener('click', function () {
        setTimeout(() => {
            if (navbarCollapse.classList.contains('show')) {
                navbarCollapse.style.animation = 'slideDown 0.3s ease';
            }
        }, 10);
    });
}

// Add CSS animation for mobile menu
const style = document.createElement('style');
style.textContent = `
            @keyframes slideDown {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        `;
document.head.appendChild(style);

// Enhanced form validation
document.querySelectorAll('form').forEach(form => {
    form.addEventListener('submit', function (e) {
        e.preventDefault();

        // Add loading state to submit button
        const submitBtn = this.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';
        submitBtn.disabled = true;

        // Simulate form submission
        setTimeout(() => {
            submitBtn.innerHTML = '<i class="fas fa-check me-2"></i>Success!';
            setTimeout(() => {
                submitBtn.innerHTML = originalText;
                submitBtn.disabled = false;
            }, 2000);
        }, 2000);
    });
});
