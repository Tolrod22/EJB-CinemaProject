package fr.ensibs.sessions;

import fr.ensibs.entities.Cinema;
import fr.ensibs.entities.Employee;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class EmployeeService implements EmployeeServiceLocal, EmployeeServiceRemote {

    @PersistenceContext(unitName = "cinema")
    private EntityManager em;

    @Override
    public void createEmployee(String name, String surname, int age, int salary, Cinema cinema) {
        Employee employee = new Employee();
        employee.setName(name);
        employee.setSurname(surname);
        employee.setAge(age);
        employee.setSalary(salary);
        employee.setCinema(cinema);
        em.persist(employee);
        em.getEntityManagerFactory().getCache().evict(Cinema.class, cinema.getIdCinema());
    }

    @Override
    public List<Employee> getAllEmployees(Cinema cinema) {
        return em.createQuery("SELECT e FROM Employee e WHERE e.cinema = :cinemaId", Employee.class).setParameter("cinemaId", cinema).getResultList();
    }

    @Override
    public void removeEmployee(Long id, Long idCinema) {
        Employee toRemove = em.createQuery("SELECT e FROM Employee e WHERE e.idEmployee = :employeeId", Employee.class).setParameter("employeeId", id).getSingleResult();
        em.remove(toRemove);
        em.getEntityManagerFactory().getCache().evict(Cinema.class, idCinema);
    }
}
